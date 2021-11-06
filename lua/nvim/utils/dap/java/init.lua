local dap = require 'dap'
local class = require 'pl.class'
local List = require 'pl.List'
local Promise = require 'promise'
local Client = require 'nvim.utils.lsp.java.client'
local TestKind = require 'nvim.utils.lsp.java.test-kind'
local TestLevel = require 'nvim.utils.lsp.java.test-level'

local JUnit = require 'nvim.utils.dap.java.test.junit'
local Notify = require 'nvim.utils.notify'

---@diagnostic disable-next-line: undefined-global
local v = vim
local loop = v.loop
local api = v.api

local function flatten_classpaths(classpaths)
    local flatten_classpath_list = {}

    for _, classpath in ipairs(classpaths) do
        for _, path in ipairs(classpath) do
            table.insert(flatten_classpath_list, path)
        end
    end

    return flatten_classpath_list
end

local JavaDap = class()

function JavaDap:_init()
    self.client = Client
    self.test_handlers = {}
    self.test_handlers[TestKind.JUnit] = JUnit()
end

--- Start the debug session
-- @returns { Promise } promise with the port number
function JavaDap.start_debug_session(self)
    return self.client.start_debug_session()
end

--- Returns project name and classpaths for each and every main class
-- @returns { Promise } classpath information
function JavaDap.get_resolved_main_classes(self)
    return self.client.resolve_main_class():thenCall(
               function(main_classes)
            -- result sample
            --
            -- { {
            --  filePath = "/home/s1n7ax/Workspace/demo/src/main/java/com/example/demo/DemoApplication.java",
            --  mainClass = "com.example.demo.DemoApplication",
            --  projectName = "demo"
            --  } }

            local resolve_classpath_promise_list = {}

            for _, main_class in ipairs(main_classes) do
                local project_name = main_class.projectName
                local class_name = main_class.mainClass

                local promise = self.client.resolve_classpath(
                                    class_name, project_name)

                table.insert(resolve_classpath_promise_list, promise)
            end

            return Promise.all(resolve_classpath_promise_list):thenCall(
                       function(classpaths)
                    local main_class_list_with_classpaths = {}

                    for index, main_class in ipairs(main_classes) do
                        table.insert(
                            main_class_list_with_classpaths, {
                                project_name = main_class.projectName,
                                class_name = main_class.mainClass,
                                file_path = main_class.filePath,
                                classpath = flatten_classpaths(
                                    classpaths[index]),
                            })
                    end

                    return main_class_list_with_classpaths
                end)
        end)
end

--- Creates a dap run configuration using the given information
function JavaDap.create_debug_config(_, project_name, class_name, classpath)
    return {
        name = string.format('Launch -> %s -> %s', project_name, class_name),
        projectName = project_name,
        mainClass = class_name,
        classPaths = V.tbl_flatten(classpath),
        modulePaths = {},
        request = 'launch',
        type = 'java',
    }
end

--- Returns the dap java configuration
-- @returns { Promise } dap configuration
function JavaDap.get_dap_config(self)
    return self:get_resolved_main_classes():thenCall(
               function(main_classes)
            -- class paths result structure is
            --
            --  { {
            --  class_name = "com.example.demo.DemoApplication",
            --  classpaths = {"path"},
            --  file_path = "/home/s1n7ax/Workspace/demo/src/main/java/com/example/demo/DemoApplication.java",
            --  project_name = "demo"
            --  } }

            local classpath_list = List(main_classes)

            return classpath_list:map(
                       function(main_class)
                    return self:create_debug_config(
                               main_class.project_name, main_class.class_name,
                               main_class.classpath)
                end)
        end)
end

function JavaDap.run_test_class(self, buffer)
    self.client.find_test_types_and_methods(buffer):thenCall(
        function(tests)
            local test_class = nil

            for _, test in ipairs(tests) do
                if test.testLevel == TestLevel.Class then
                    test_class = test
                end
            end

            local test_kind = test_class.testKind

            local test_handler = self.test_handlers[test_kind]

            if not test_handler then
                Notify:error(
                    'Cannot find test handler for test kind ' + test_kind)

                return
            end

            test_handler.run(test_class)

        end):catch(
        function(error)
            Notify:error(error.message)
        end)
end

function JavaDap.run_current_test_class(self)
    local buffer = api.nvim_get_current_buf()
    self:run_test_class(buffer)
end

function JavaDap.run(self, buffer)
    local junit = require('jdtls.junit')

    local server = loop.new_tcp()
    local test_results = junit.mk_test_results(buffer)

    local before = function(conf)
        server:bind('127.0.0.1', 0)
        server:listen(
            128, function(err2)
                assert(not err2, err2)
                local sock = V.loop.new_tcp()
                server:accept(sock)
                sock:read_start(test_results.mk_reader(sock))
            end)
        conf.args = conf.args:gsub(
                        '-port ([0-9]+)', '-port ' .. server:getsockname().port);
        return conf
    end

    local after = function()
        server:shutdown()
        server:close()
        local items = test_results.show()
        -- M.maybe_repeat(lens, config, context, opts, items)
    end

    dap.run(
        self.config, {
            before = before,
            after = after,
        })
end

return JavaDap
