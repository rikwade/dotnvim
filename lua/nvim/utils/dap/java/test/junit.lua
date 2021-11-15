local class = require 'pl.class'
local TestKind = require 'nvim.utils.lsp.java.test-kind'
local Client = require 'nvim.utils.lsp.java.client'
local dap = require 'dap'
local TestResultParser = require 'nvim.utils.dap.java.test.test-result-parser'

local loop = vim.loop

local JUnit = class()

function JUnit:_init()
    self.client = Client
    self.test_result_parser = TestResultParser()
end

function JUnit.run(self, projectName, testKind, testLevel, testNames)
    return self.client.test.junit.arguments(
               projectName, testKind, testLevel, testNames):thenCall(
               function(launch_args)

            local config = JUnit.get_run_args(testNames[1], launch_args, true)

            self:_run(config)
        end)
end

function JUnit._run(self, config)
    local server = nil

    dap.run(
        config, {
            before = function(conf)

                server = loop.new_tcp()
                server:bind('127.0.0.1', 0)
                server:listen(
                    128, function(err2)
                        assert(not err2, err2)

                        local conn = vim.loop.new_tcp()

                        server:accept(conn)
                        conn:read_start(
                            self.test_result_parser.get_stream_reader(conn))
                    end)

                conf.args = conf.args:gsub(
                                '-port ([0-9]+)',
                                '-port ' .. server:getsockname().port);
                return conf
            end,

            after = function()
                server:shutdown()
                server:close()
            end,
        })
end

function JUnit.get_run_args(testName, launch_args, debug)
    return {
        projectName = launch_args.projectName,
        classPaths = launch_args.classpath,
        mainClass = 'org.eclipse.jdt.internal.junit.runner.RemoteTestRunner',
        args = table.concat(launch_args.programArguments, ' '),
        cwd = launch_args.workingDirectory,

        noDebug = not (debug),
        request = 'launch',
        type = 'java',
        vmArgs = '-ea',
        name = testName,
        modulePaths = {},
    }
end

return JUnit
