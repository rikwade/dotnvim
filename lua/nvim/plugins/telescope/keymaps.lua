local Shortcut = R'nvim.newutil.keymap'.Shortcut
local l = Keybind.get_lua_cmd_string

local builtin = function(function_name)
    local cmd = 'R"telescope.builtin".' .. function_name
    return l(cmd)
end

Shortcut:mode('n'):options():noremap():next():keymaps():map(

    {
        ----------------------------------------------------------------------
        --                          FILES & BUFFER                          --
        ----------------------------------------------------------------------
        -- find a file in current working directory
        { '<leader>p', builtin 'find_files()' },

        -- resumes the previous search
        { '<c-p>', builtin 'resume()' },

        -- find line in current buffer
        { '<leader>/', builtin 'current_buffer_fuzzy_find()' },

        -- find line in current working directory
        { '<leader>t', builtin 'live_grep()' },

        -- find word under the cursor in current buffer
        { '*', builtin 'grep_string()' },

        -- find buffer
        { '<leader>b', builtin 'buffers()' },

        -- find help index
        { '<leader>th', builtin 'help_tags()' },

        ----------------------------------------------------------------------
        --                               LSP                                --
        ----------------------------------------------------------------------
        -- find references of word under the cursor
        { '<leader>r', builtin 'lsp_references()' },

        -- find diagnostics in the project
        { '<leader>d', builtin 'lsp_workspace_diagnostics()' },
    })

Shortcut:mode('i'):options():noremap():next():keymaps():map(
    {
        -- find register by containing value
        { '<c-r>', builtin 'registers()' },
    })
