local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

local M = {}

function M.setup()
    mason.setup()
    mason_lspconfig.setup({
        automatic_installation = true,

        ui = {
            icons = {
                server_installed = '✓',
                server_pending = '➜',
                server_uninstalled = '✗',
            },
        },
    })
end

return M
