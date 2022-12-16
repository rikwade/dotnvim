local Lsp = require('nvim.utils.lsp')
local LspEventType = require('nvim.utils.lsp.event')

local M = {}

function M.setup()
    Lsp.add_listener(LspEventType.SERVER_SETUP, function(ls, conf)
        if ls == 'sumneko_lua' then
            conf:set_option('settings', {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                },
            })
        end
    end)
end

return M
