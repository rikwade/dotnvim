local Promise = require('promise')

local lsp = vim.lsp

local Client = {}

function Client:new(args)
	local o = {
    buffer = args.buffer,
    client = args.client
	}

    setmetatable(o, self)
    self.__index = self

    return o
end


--- Run workspace command
-- @param { WorkspaceCommandParam } command parameters
-- @returns { Promise<...any> } promise
function Client.execute_workspace_command(self, param)
    -- use the client if available
    if self.client then
        return Promise.new(function(response, reject)
            self.client.request(
                'workspace/executeCommand',
                param,
                function(error, ...)
                    if error then
                        reject(error)
                    else
                        response(...)
                    end
                end,
                self.buffer
            )
        end)
    end

    -- use client registered for the given buffer
    return Promise.new(function(response, reject)
        lsp.buf_request(
            self.buffer,
            'workspace/executeCommand',
            param,
            function(error, ...)
                if error then
                    reject(error)
                else
                    response(...)
                end
            end
        )
    end)
end

return Client
