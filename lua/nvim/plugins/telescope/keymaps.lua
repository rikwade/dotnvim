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
        { '<leader>t', builtin 'find_files()' },

        -- find line in current working directory
        { '<leader>s', builtin 'live_grep()' },

        -- resumes the previous search
        { '<leader>r', builtin 'resume()' },

        -- find buffer
        { '<leader>p', builtin 'buffers()' },

        -- find line in current buffer
        { '<leader>f', builtin 'current_buffer_fuzzy_find()' },

        -- find word under the cursor in current buffer
        { '*', builtin 'grep_string()' },

        -- find help index
        { '.th', builtin 'help_tags()' },

        ----------------------------------------------------------------------
        --                               LSP                                --
        ----------------------------------------------------------------------
        -- find references of word under the cursor
        { '<leader>o', builtin 'lsp_references()' },

        -- find diagnostics in the project
        { '.td', builtin 'lsp_workspace_diagnostics()' },
    })

Shortcut:mode('i'):options():noremap():next():keymaps():map(
    {
        -- find register by containing value
        { '<c-r>', builtin 'registers()' },
    })
