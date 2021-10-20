local Promise = R 'promise'
local class = require 'pl.class'
local WorkspaceCommandParam = require('nvim.utils.lsp.workspace-command-param')

local Client = class()

function Client:_init(arg)
    self.buffer = arg.buffer
    self.client = arg.client
end

--- Run workspace command
-- @param { WorkspaceCommandParam } command parameters
-- @returns { Promise<...any> } promise
function Client.execute_workspace_command(self, param)
    assert(
        WorkspaceCommandParam:class_of(param),
        'expected param to be a type of class WorkspaceCommandParam but passed ' ..
            tostring(param))

    -- use the client if available
    if self.client then
        return Promise.new(
                   function(response, reject)
                self.client.request(
                    'workspace/executeCommand', param, function(error, ...)
                        if error then
                            reject(error)
                        else
                            response(...)
                        end
                    end, self.buffer)
            end)
    end

    -- use client registered for the given buffer
    return Promise.new(
               function(response, reject)
            LSP.buf_request(
                self.buffer, 'workspace/executeCommand', param,
                function(error, ...)
                    if error then
                        reject(error)
                    else
                        response(...)
                    end
                end)
        end)
end

return Client
