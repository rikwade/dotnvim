local l = Keybind.get_lua_cmd_string
local opts = {noremap = true}

local on_attach = function(bufnr)
    Keybind.b({
        -- code jumps
        {bufnr, 'n', 'gd', l 'vim.lsp.buf.definition()', opts},
        {bufnr, 'n', 'gi', l 'vim.lsp.buf.implementation()', opts},
        {bufnr, 'n', 'gr', l 'vim.lsp.buf.references()', opts},
        {bufnr, 'n', 'gt', l 'vim.lsp.buf.type_definition()', opts},
        {bufnr, 'n', 'K', l 'vim.lsp.buf.hover()', opts},
        {bufnr, 'n', 'gD', l 'vim.lsp.buf.declaration()', opts},
        {bufnr, 'n', '<c-k>', l 'vim.lsp.buf.signature_help()', opts},
        -- jump to next error
        {bufnr, 'n', ']d', l 'vim.lsp.diagnostic.goto_next()', opts},
        -- jump to previous error
        {bufnr, 'n', '[d', l 'vim.lsp.diagnostic.goto_prev()', opts},
        -- rename file name
        {bufnr, 'n', '<leader>r', l 'vim.lsp.buf.rename()', opts},
        -- quick fix actions
        {bufnr, 'n', '<leader>a', l 'vim.lsp.buf.code_action()', opts},
        -- show diagnostics for current line
        {
            bufnr,
            'n',
            '<leader>e',
            l 'vim.lsp.diagnostic.show_line_diagnostics()',
            opts,
        },
        -- show all diagnostics
        {bufnr, 'n', '<leader>o', l 'vim.lsp.diagnostic.set_loclist()', opts},

        -- create folder
        -- @TODO fali with error
        {bufnr, 'n', '<space>wa', l 'vim.lsp.buf.add_workspace_folder()', opts},
        -- remove folder
        -- @TODO fali without error
        {
            bufnr,
            'n',
            '<space>wr',
            l 'vim.lsp.buf.remove_workspace_folder()',
            opts,
        },
        -- show workspace folders
        {
            bufnr,
            'n',
            '<space>wl',
            l 'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))',
            opts,
        },
    })
end

return {on_attach = on_attach}
