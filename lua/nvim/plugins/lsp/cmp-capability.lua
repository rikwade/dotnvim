local Lsp = require('nvim.plugins.lsp')
local LspEventType = require('nvim.plugins.lsp.event')

local M = {}

function M.setup()
    Lsp.add_listener(LspEventType.SERVER_SETUP, function(ls, _)
        local capabilities = require('cmp_nvim_lsp').update_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        )

        require('lspconfig')[ls].setup({
            capabilities = capabilities,
        })
    end)
end

return M
