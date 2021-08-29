local M = {}

function M.execute_command(command, callback)
    LSP.buf_request(0, 'workspace/executeCommand', command,
                    function(err, _, resp)
        if callback then
            callback(err, resp)
        elseif err then
            print('Could not execute code action: ' .. err.message)
        end
    end)
end

return M
