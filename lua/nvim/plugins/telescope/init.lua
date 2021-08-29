local actions = R'telescope.actions'

Keybind.g({
    ----------------------------------------------------------------------
    --                          FILES & BUFFER                          --
    ----------------------------------------------------------------------
    -- find a file in current working directory
    {'n', '<c-p>', '<cmd>lua R"telescope.builtin".find_files()<cr>'},

    -- find line in current buffer
    {
        'n',
        '<leader>tf',
        '<cmd>lua R"telescope.builtin".current_buffer_fuzzy_find()<cr>',
    },

    -- find line in current working directory
    {'n', '<leader>tg', '<cmd>lua R"telescope.builtin".live_grep()<cr>'},

    -- find word under the cursor in current buffer
    {
        'n',
        '<leader>*',
        '<cmd>lua R"telescope.builtin".grep_string()<cr>',
    },

    -- find buffer
    {'n', '<c-t>', '<cmd>lua R"telescope.builtin".buffers()<cr>'},

    -- find help index
    {'n', '<leader>th', '<cmd>lua R"telescope.builtin".help_tags()<cr>'},

    -- find register by containing value
    {'i', '<c-r>', '<cmd>lua R"telescope.builtin".registers()<cr>'},

    ----------------------------------------------------------------------
    --                               LSP                                --
    ----------------------------------------------------------------------
    -- find references of word under the cursor
    {
        'n',
        '<leader>tsr',
        ':lua R"telescope.builtin".lsp_references()<cr>',
    },
})

R'telescope'.setup()
