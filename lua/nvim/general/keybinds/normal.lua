Keybind.g({
    ----------------------------------------------------------------------
    --                              CONFIG                              --
    ----------------------------------------------------------------------
    -- reload nvim configuration file
    {
        'n',
        ',r',
        [[:lua R 'nvim.utils.common.module'.reload_package('nvim')<CR>]],
    },

    ----------------------------------------------------------------------
    --                           CURSOR MOVE                            --
    ----------------------------------------------------------------------
    -- [ ctrl + h ] move cursor to left window
    {'n', '<c-h>', '<c-w>h'},

    -- [ ctrl + l ] move cursor to right window
    {'n', '<c-l>', '<c-w>l'},

    -- [ ctrl + j ] move cursor to bottom window
    {'n', '<c-j>', '<c-w>j'},

    -- [ ctrl + k ] move cursor to top window
    {'n', '<c-k>', '<c-w>k'},

    -- [ '' ] move to last cursor position in the jump list
    {'n', [['']], '``'},

   -- [ 0 ] to go to the start of the line
    {'n', '0', '^'},

    -- centering the cursor
    {'n', '{', '{zz'},
    {'n', '}', '}zz'},
    {'n', 'n', 'nzz'},
    {'n', 'N', 'Nzz'},

    ----------------------------------------------------------------------
    --                        BUFFER READ WRITE                         --
    ----------------------------------------------------------------------
    -- [ ctrl + s ] save the current buffer
    {'n', '<leader>s', ':w<cr>'},

    -- [ ctrl + q ] quite the current buffer
    {'n', '<c-q>', ':q<cr>'},

    ----------------------------------------------------------------------
    --                          CUT COPY PASTE                          --
    ----------------------------------------------------------------------
    -- [ Y ] copy until the end of the line
    {'n', 'Y', 'y$'},

    -- [ ctrl + y ] copy current line and paste next line
    {'n', '<c-y>', 'yyp'},

    ----------------------------------------------------------------------
    --                             EDITING                              --
    ----------------------------------------------------------------------
    -- [ < ] indent left
    {'n', '<', '<<'},

    -- [ > ] indent right
    {'n', '>', '>>'},

    ----------------------------------------------------------------------
    --                              OTHER                               --
    ----------------------------------------------------------------------
    -- [ <F6> ] to go enable spell checker
    {'', '<F6>', ':setlocal spell! spelllang=en_us<cr>'},
})
