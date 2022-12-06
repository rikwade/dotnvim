local Shortcut = require('nvim.utils.nvim.shortcut')
local common = require('nvim.utils.common.module')
local window = require('nvim.utils.nvim.window')

Shortcut():mode('n'):options():noremap():next():keymaps({
    ----------------------------------------------------------------------
    --                              CONFIG                              --
    ----------------------------------------------------------------------
    -- reload nvim configuration file
    {
        '<tab>r',
        function()
            common.reload_package('nvim')
        end,
    },

    ----------------------------------------------------------------------
    --                           CURSOR MOVE                            --
    ----------------------------------------------------------------------
    -- move cursor to left window
    { '<c-m>', '<c-w>h' },

    -- move cursor to right window
    { '<c-i>', '<c-w>l' },

    -- move cursor to bottom window
    { '<c-n>', '<c-w>j' },

    -- move cursor to top window
    { '<c-e>', '<c-w>k' },

    -- move cursor to last window
    { '<c-w><c-w>', '<c-w>p' },

    -- move to last cursor position in the jump list
    { [['']], '``' },

    -- to go to the start of the line
    { '0', '^' },

    -- centering the cursor after action
    { '{', '{zz' },
    { '}', '}zz' },
    { 'k', 'nzz' },
    { 'K', 'Nzz' },


    ----------------------------------------------------------------------
    --                        BUFFER READ WRITE                         --
    ----------------------------------------------------------------------
    -- save the current buffer
    { ',w', '<cmd>silent w<cr>' },

    -- close the window
    { ',q', '<cmd>q<cr>' },

    -- close the tab
    { ',Q', '<cmd>tabclose<cr>' },

    ----------------------------------------------------------------------
    --                              JUMPS                               --
    ----------------------------------------------------------------------
    { '<c-l>', '<c-i>' },

    ----------------------------------------------------------------------
    --                      BUFFER & WINDOW SWITCH                      --
    ----------------------------------------------------------------------
    -- open the file under the cursor in a split or selected window
    {
        'gf',
        function()
            require('nvim.utils.nvim.file').open_file_under_cursor()
        end,
    },

    -- open the file under the cursor in the same window
    { 'gF', 'gf' },

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
    -- go to insert mode
    { ';', 'i' },

    -- find next occurrence of the line search
    { 'j', ';' },

    ----------------------------------------------------------------------
    --                           SPLIT WINDOW                           --
    ----------------------------------------------------------------------
    { '<tab>h', window.split_left },

    { '<tab>n', window.split_bottom },

    { '<tab>e', window.split_top },

    { '<tab>i', window.split_right },

    ----------------------------------------------------------------------
    --                              OTHER                               --
    ----------------------------------------------------------------------
    -- to go enable spell checker
    { '<F6>', '<cmd>setlocal spell! spelllang=en_us<cr>' },
})
