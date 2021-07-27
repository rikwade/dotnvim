local compe = require('nvim.plugins.nvim-compe')
local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')

-- Automatically reload after `:LspInstall <server>`
lspinstall.post_install_hook = function()
    setup_servers()
    vim.cmd("bufdo e")
end

local on_attach_callback = function(_, bufnr)
    local opts = {noremap = true}

    compe.on_attach(bufnr)

    Keybind.b({
        -- code jumps
        {bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts},
        {bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts},
        {bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts},
        {bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts},
        {bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts},
        {bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts},
        {bufnr, 'n', '<K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts},

        -- error jumps
        {
            bufnr, 'n', '<leader>j',
            '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts
        },
        {
            bufnr, 'n', '<leader>k',
            '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts
        }, -- actions
        {bufnr, 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts},
        {
            bufnr, 'n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>',
            opts
        },
        -- { bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts },
        {
            bufnr, 'n', '<leader>o',
            '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts
        }
    })

end

local setup_servers = function()
    lspinstall.setup()

    local servers = lspinstall.installed_servers()

    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({on_attach = on_attach_callback})
    end
end

setup_servers()
