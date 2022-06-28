local lsp_install = require('nvim-lsp-installer')

local M = {}

function M.setup()
    lsp_install.setup({
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
