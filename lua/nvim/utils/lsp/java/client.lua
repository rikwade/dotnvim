local class = require 'pl.class'
local Client = require 'nvim.utils.lsp.client'
local Assert = require 'nvim.utils.validator.assert'
local WorkspaceCommandParam = R 'nvim.utils.lsp.workspace-command-param'
local ResolveClasspathArguments =
    require 'nvim.utils.lsp.java.arguments.resolve-classpath-arguments'
local GetClasspathArguments =
    require 'nvim.utils.lsp.java.arguments.get-classpath-arguments'
local FindTestTypesAndMethodsArguments =
    require 'nvim.utils.lsp.java.arguments.find-test-types-and-methods-arguments'

local Command = class()

function Command:_init()
    self.client = Client(
                      {
            buffer = 0,
        })
end

--- Starts the debug session and returns the port number
-- @returns { Promise<port> } port number
function Command.start_debug_session(self)
    local cmd_param = WorkspaceCommandParam('vscode.java.startDebugSession')
    return self.client:execute_workspace_command(cmd_param)
end

--- Returns all the main classes
-- @returns
function Command.resolve_main_class(self)
    local cmd_param = WorkspaceCommandParam('vscode.java.resolveMainClass')
    return self.client:execute_workspace_command(cmd_param)
end

--- Returns the classpaths
-- @param { string } class_name full name of the main class
-- @param { ResolveClasspathCommandArguments } command arguments
-- @returns {} class paths
function Command.resolve_classpath(self, arguments)
    Assert:is_instance_of(
        ResolveClasspathArguments, arguments, nil, 'ResolveClasspathArguments')

    local cmd_param = WorkspaceCommandParam(
                          {
            command = 'vscode.java.resolveClasspath',
            arguments = arguments,
        })

    return self.client:execute_workspace_command(cmd_param)
end

--- Returns the classpaths for given buffer
-- @param { number } buffer buffer number
-- @param { GetClasspathArguments } arguments to pass to the command
function Command.get_classpaths(_, buffer, arguments)
    Assert:is_instance_of(
        GetClasspathArguments, arguments, nil, 'GetClasspathArguments')

    local client = Client(
                       {
            buffer = buffer,
        })

    local cmd_param = WorkspaceCommandParam(
                          {
            command = 'java.project.getClasspaths',
            arguments = arguments,
        })

    return client:execute_workspace_command(cmd_param)
end

--- Returns the test information for a given buffer
-- @param { number } buffer buffer number
-- @param { FindTestTypesAndMethodsArguments } arguments arguments to pass to the command
function Command.find_test_types_and_methods(_, buffer, arguments)
    Assert:is_instance_of(
        FindTestTypesAndMethodsArguments, arguments, nil,
        'FindTestTypesAndMethodsArguments')

    local client = Client(
                       {
            buffer = buffer,
        })

    local cmd_param = WorkspaceCommandParam(
                          {
            command = 'vscode.java.test.findTestTypesAndMethods',
            arguments = arguments,
        })

    return client:execute_workspace_command(cmd_param)
end

return Command
