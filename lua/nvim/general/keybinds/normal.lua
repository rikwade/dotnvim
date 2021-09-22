local Shortcut = R'nvim.newutil.keymap'.Shortcut
local l = R'nvim.utils.keybind'.get_lua_cmd_string
local c = R'nvim.utils.keybind'.get_cmd_string

Shortcut:mode('n'):options():noremap():next():keymaps():map(
    {
        ----------------------------------------------------------------------
        --                              CONFIG                              --
        ----------------------------------------------------------------------
        -- reload nvim configuration file
        { ',r', l 'R"nvim.utils.common.module".reload_package("nvim")' },

        ----------------------------------------------------------------------
        --                           CURSOR MOVE                            --
        ----------------------------------------------------------------------
        -- move cursor to left window
        { '<leader>h', '<c-w>h' },

        -- move cursor to right window
        { '<leader>i', '<c-w>l' },

        -- move cursor to bottom window
        { '<leader>n', '<c-w>j' },

        -- move cursor to top window
        { '<leader>e', '<c-w>k' },

        -- move cursor to last window
        { '<leader>w', '<c-w>p' },

        -- move to last cursor position in the jump list
        { [['']], '``' },

        -- to go to the start of the line
        { '0', '^' },

        -- centering the cursor after action
        { '{', '{zz' },
        { '}', '}zz' },
        { 'k', 'nzz' },
        { 'K', 'Nzz' },

        -- jump to next matching char in the same line
        { '<leader>;', ';' },

        ----------------------------------------------------------------------
        --                        BUFFER READ WRITE                         --
        ----------------------------------------------------------------------
        -- save the current buffer
        { '<leader>s', c 'w' },

        -- close the window
        { '<leader>q', c 'q' },

        -- close the buffer with out saving
        { '<leader>x', c 'q!' },

        ----------------------------------------------------------------------
        --                          CUT COPY PASTE                          --
        ----------------------------------------------------------------------
        -- copy until the end of the line
        { 'Y', 'y$' },

        -- copy current line and paste next line
        { '<leader>y', 'yyp' },

        ----------------------------------------------------------------------
        --                             EDITING                              --
        ----------------------------------------------------------------------
        -- indent left
        { '<', '<<' },

        -- indent right
        { '>', '>>' },

        -- go to insert mode
        { ';', 'i' },

        ----------------------------------------------------------------------
        --                              OTHER                               --
        ----------------------------------------------------------------------
        -- to go enable spell checker
        { '<F6>', c 'setlocal spell! spelllang=en_us' },
    })
