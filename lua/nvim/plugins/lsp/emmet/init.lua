local Lsp = require('nvim.utils.lsp')
local LspEventType = require('nvim.utils.lsp.event')

local M = {}

function M.setup()
    Lsp.add_listener(LspEventType.SERVER_SETUP, function(ls, conf)
        if ls == 'emmet_ls' then
            conf:append_option('filetypes', 'rust')
        end
    end)
end

return M
