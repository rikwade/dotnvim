local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

local M = {}

function M.setup()
    mason.setup()
    mason_lspconfig.setup({
        ensure_installed = { 'jdtls@1.12.0-202206011637' },
        automatic_installation = { exclude = { 'jdtls' } },
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
