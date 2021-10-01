local M = {
    on_setup_callback_map = {},
}

function M.execute_command(command, callback)
    LSP.buf_request(
        0, 'workspace/executeCommand', command, function(err, _, res)
            if callback then
                callback(err, res)
            elseif err then
                print('Execute command failed: ' .. err.message)
            end
        end)
end

function M.add_on_setup_callback(lang, func)
    M.on_setup_callback_map[lang] = func
end

function M.on_setup(ls, config)
    local updated_config = nil

    if M.on_setup_callback_map[ls] then
        updated_config = M.on_setup_callback_map[ls](config)
    end

    return updated_config or config
end

return M
