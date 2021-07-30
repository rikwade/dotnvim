local compe = require('nvim.plugins.nvim-compe')
local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')

local on_attach_callback = function(_, bufnr)
    local opts = {noremap = true}

    compe.on_attach(bufnr)

    Keybind.b({
        -- code jumps
        {bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts},
        {bufnr, 'n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts},
        {bufnr, 'n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts},
        {bufnr, 'n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', opts},
        {bufnr, 'n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts},
        {bufnr, 'n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts},
        {bufnr, 'n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>', opts},
        -- jump to next error
        {bufnr, 'n', ']d', ':lua vim.lsp.diagnostic.goto_next()<CR>', opts},
        -- jump to previous error
        {bufnr, 'n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>', opts},
        -- rename file name
        {bufnr, 'n', '<leader>r', ':lua vim.lsp.buf.rename()<CR>', opts},
        -- quick fix actions
        {bufnr, 'n', '<leader>a', ':lua vim.lsp.buf.code_action()<CR>', opts},
        -- show diagnostics for current line
        {
            bufnr,
            'n',
            '<leader>e',
            ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
            opts,
        },
        -- show all diagnostics
        {
            bufnr,
            'n',
            '<leader>o',
            ':lua vim.lsp.diagnostic.set_loclist()<CR>',
            opts,
        },

        -- create folder
        -- @TODO fali with error
        {
            bufnr,
            'n',
            '<space>wa',
            ':lua vim.lsp.buf.add_workspace_folder()<CR>',
            opts,
        },
        -- remove folder
        -- @TODO fali without error
        {
            bufnr,
            'n',
            '<space>wr',
            ':lua vim.lsp.buf.remove_workspace_folder()<CR>',
            opts,
        },
        -- show workspace folders
        {
            bufnr,
            'n',
            '<space>wl',
            ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
            opts,
        },
    })
end

local setup_servers = function()
    lspinstall.setup()

    local servers = lspinstall.installed_servers()

    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
            on_attach = on_attach_callback,
            -- @TODO find out what debounce_text_changes does
            flags = {debounce_text_changes = 150},
        })
    end
end

setup_servers()
