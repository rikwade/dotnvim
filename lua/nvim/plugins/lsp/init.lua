local lspconfig = R 'lspconfig'
local lspinstall = R 'lspinstall'
local keymaps = R 'nvim.plugins.lsp.keymaps'
local ui = R 'nvim.plugins.lsp.ui'

local on_attach_callback = function(_, bufnr)
    keymaps.on_attach(bufnr)
    ui.on_attach()
end

local setup_servers = function()
    lspinstall.setup()

    local servers = lspinstall.installed_servers()

    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
            on_attach = on_attach_callback,
            -- @TODO find out what debounce_text_changes does
            flags = {debounce_text_changes = 20},
        })
    end

end

setup_servers()
