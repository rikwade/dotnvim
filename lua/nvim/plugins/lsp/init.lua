local lspconfig = R 'lspconfig'
local lspinstall = R 'lspinstall'
local keymaps = R 'nvim.plugins.lsp.keymaps'
local ui = R 'nvim.plugins.lsp.ui'
local dap = R 'nvim.plugins.nvim-dap'
local lsp_util = R 'nvim.utils.lsp'

local on_attach_callback = function(conf, bufnr)
    keymaps.on_attach(bufnr)
    ui.on_attach()
    dap.on_attach(conf, bufnr)
end

local setup_servers = function()
    lspinstall.setup()

    local servers = lspinstall.installed_servers()

    for _, ls in ipairs(servers) do
        local config = {
            on_attach = on_attach_callback,
        }

        config = lsp_util.on_setup(ls, config)

        lspconfig[ls].setup(config)
    end

end

setup_servers()
