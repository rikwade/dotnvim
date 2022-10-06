local Lsp = require('nvim.utils.lsp')
local LspEventType = require('nvim.utils.lsp.event')

local M = {}

function M.setup()
    Lsp.add_listener(LspEventType.SERVER_SETUP, function(_, conf)
        local capabilities = conf:get_option_or_default(
            'capabilities',
            vim.lsp.protocol.make_client_capabilities()
        )

        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }
    end)
end

return M
