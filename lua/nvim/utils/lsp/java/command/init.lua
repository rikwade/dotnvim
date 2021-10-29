local class = R 'pl.class'
local Client = R 'nvim.utils.lsp.client'
local WorkspaceCommandParam = R 'nvim.utils.lsp.workspace-command-param'
local ResolveClasspathArguments =
    require 'nvim.utils.lsp.java.command.arguments.resolve-classpath-arguments'
local GetClasspathArguments =
    require 'nvim.utils.lsp.java.command.arguments.resolve-classpath-arguments'

local Command = class()

function Command:_init()
    self.client = Client({ buffer = 0 })
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
    assert(
        ResolveClasspathArguments:class_of(arguments),
        'expected arguments to be type ResolveClasspathArguments but passed ' ..
            tostring(arguments))

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
function Command.get_classpaths(buffer, arguments)
    assert(
        GetClasspathArguments:class_of(arguments),
        'expected arguments to be type GetClasspathArguments but passed ' ..
            tostring(arguments))

    local cmd_param = WorkspaceCommandParam(
                          {
            command = 'java.project.getClasspaths',
            arguments = arguments,
        })

    local client = Client({ buffer = buffer })

    return client:execute_workspace_command(cmd_param)
end

--- Returns the test information for a given buffer
-- @param { number } buffer buffer number
-- @param { FindTestTypesAndMethodsArguments } arguments arguments to pass to the command
function Command.find_test_types_and_methods(self, buffer, arguments)
    local client = Client({ buffer = buffer })

    local cmd_param = WorkspaceCommandParam(
                          {
            command = 'vscode.java.test.findTestTypesAndMethods',
            arguments = arguments,
        })

    return client:execute_workspace_command(cmd_param)
end

return Command
