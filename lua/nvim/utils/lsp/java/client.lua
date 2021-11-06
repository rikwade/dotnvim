local class = require 'pl.class'
local LspClient = require 'nvim.utils.lsp.client'
local Assert = require 'nvim.utils.validator.assert'
local WorkspaceCommandParam = R 'nvim.utils.lsp.workspace-command-param'
local TestKind = require 'nvim.utils.lsp.java.test-kind'
local TestLevel = require 'nvim.utils.lsp.java.test-level'
local Notify = require 'nvim.utils.notify'

local self = {
    client = LspClient(
        {
            buffer = 0,
        }),
}

local function make_junit_request_args(lens, uri)
    local methodname = ''
    local name_parts = vim.split(lens.fullName, '#')
    local classname = name_parts[1]
    if #name_parts > 1 then
        methodname = name_parts[2]
        if lens.paramTypes and #lens.paramTypes > 0 then
            methodname = string.format(
                             '%s(%s)', methodname,
                             table.concat(lens.paramTypes, ','))
        end
    end
    -- Format changes with https://github.com/microsoft/vscode-java-test/pull/1257
    local new_api = lens.testKind ~= nil
    local req_arguments
    if new_api then
        req_arguments = {
            testKind = lens.testKind,
            projectName = lens.projectName,
            testLevel = lens.testLevel,
        }
        if lens.testKind == TestKind.TestNG or lens.testLevel == TestLevel.Class then
            req_arguments.testNames = { lens.fullName }
        elseif lens.testLevel then
            req_arguments.testNames = { lens.jdtHandler }
        end
    else
        req_arguments = {
            uri = uri,
            -- Got renamed to fullName in https://github.com/microsoft/vscode-java-test/commit/57191b5367ae0a357b80e94f0def9e46f5e77796
            -- Include both for BWC
            classFullName = classname,
            fullName = classname,
            testName = methodname,
            project = lens.project,
            scope = lens.level,
            testKind = lens.kind,
        }
    end
    return req_arguments
end

local function get_uri(buffer)
    return v.uri_from_bufnr(buffer)
end

local function get_json(value)
    return fn.json_encode(value)
end

local Client = {
    --- Starts the debug session and returns the port number
    -- @returns { Promise<port> } port number
    start_debug_session = function()
        local cmd_param = WorkspaceCommandParam('vscode.java.startDebugSession')
        return self.client:execute_workspace_command(cmd_param)
    end,

    --- Returns all the main classes
    -- @returns
    resolve_main_class = function()
        local cmd_param = WorkspaceCommandParam('vscode.java.resolveMainClass')
        return self.client:execute_workspace_command(cmd_param)
    end,

    --- Returns the classpaths
    -- @param { string } class_name full name of the main class
    -- @param { ResolveClasspathCommandArguments } command arguments
    -- @returns {} class paths
    resolve_classpath = function(class_name, project_name)
        local cmd_param = WorkspaceCommandParam(
                              {
                command = 'vscode.java.resolveClasspath',
                arguments = { class_name, project_name },
            })

        return self.client:execute_workspace_command(cmd_param)
    end,

    test = {
        --- Returns the test information for a given buffer
        -- @param { number } buffer buffer number
        -- @param { FindTestTypesAndMethodsArguments } arguments arguments to pass to the command
        find_test_types_and_methods = function(buffer)
            local client = LspClient(
                               {
                    buffer = buffer,
                })

            local cmd_param = WorkspaceCommandParam(
                                  {
                    command = 'vscode.java.test.findTestTypesAndMethods',
                    arguments = { get_uri(buffer) },
                })

            return client:execute_workspace_command(cmd_param)
        end,

        junit = {
            arguments = function(value)
                local cmd_param = WorkspaceCommandParam(
                                      {
                        command = 'vscode.java.test.junit.argument',
                        arguments = { get_json(value) },
                    })

                return self.client:execute_workspace_command(cmd_param)
            end,
        },
    },

    project = {
        --- Returns the classpaths for given buffer
        -- @param { number } buffer buffer number
        -- @param { GetClasspathArguments } arguments to pass to the command
        get_classpaths = function(buffer, scope)
            Assert:is_instance_of(
                GetClasspathArguments, arguments, nil, 'GetClasspathArguments')

            local client = LspClient(
                               {
                    buffer = buffer,
                })

            local cmd_param = WorkspaceCommandParam(
                                  {
                    command = 'java.project.getClasspaths',
                    arguments = {
                        get_json(
                            {
                                scope = scope,
                            }),
                    },
                })

            return client:execute_workspace_command(cmd_param)
        end,
    },
}

return Client
