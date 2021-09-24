local Shortcut = R 'nvim.newutil.keymap'
local l = Keybind.get_lua_cmd_string

local on_attach = function(bufnr)
    Shortcut:mode('n'):buffer(bufnr):options():noremap():next():keymaps(
        {

            -- go to definition of the current node
            { '<BS>t', l 'vim.lsp.buf.definition()' },

            -- go to the implementation of the current inderface node
            { '<BS>s', l 'vim.lsp.buf.implementation()' },

            -- rename file name
            { '<BS>r', l 'vim.lsp.buf.rename()' },

            -- quick fix actions
            { '<BS>a', l 'vim.lsp.buf.code_action()' },

            -- show more information about the current node
            { '<BS>n', l 'vim.lsp.buf.hover()' },

            -- jump to next error
            { ']d', l 'vim.lsp.diagnostic.goto_next()' },

            -- jump to previous error
            { '[d', l 'vim.lsp.diagnostic.goto_prev()' },

            -- show diagnostics for current line
            { '<BS>p', l 'vim.lsp.diagnostic.show_line_diagnostics()' },

            -- show all diagnostics in the current file
            { '<BS>c', l 'vim.lsp.diagnostic.set_loclist()' },

            -- create folder
            -- @TODO fali with error
            { '<BS>wa', l 'vim.lsp.buf.add_workspace_folder()' },

            -- remove folder
            -- @TODO fali without error
            { '<BS>nr', l 'vim.lsp.buf.remove_workspace_folder()' },

            -- show workspace folders
            {
                '<BS>nl',
                l 'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))',
            },

            -- @todo find out what this is
            { '<BS>f', l 'vim.lsp.buf.declaration()' },

            -- @todo find out what this is
            { '<BS>o', l 'vim.lsp.buf.signature_help()' },

            -- @todo find out what this is
            { '<BS>u', l 'vim.lsp.buf.type_definition()' },

            -- telescope overrides this functionality
            -- { '<BS>r', l 'vim.lsp.buf.references()',  },

        })
end

return { on_attach = on_attach }
