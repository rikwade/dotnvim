local M = { on_setup_callback_map = {} }

--[[
-- Register callback to be call on language server setup
--
-- @param { String } lang - callback on setup of this language
-- @param { (Conf) => Conf } - callback  function that takes config and returns
-- the updated config to use when setting up the server
--]]
function M.add_on_setup_callback(lang, callback)
    M.on_setup_callback_map[lang] = callback
end

--[[
-- Calls relevant language specific registered callbacks on setup callback
--
-- @param { String } ls - name of the language server
-- @param { Conf } Conf - language server configuration
-- @returns { Conf } updated config to use when setting up LS
--]]
function M.on_setup(ls, config)
    local updated_config = nil

    if M.on_setup_callback_map[ls] then
        updated_config = M.on_setup_callback_map[ls](config)
    end

    return updated_config or config
end

return M
