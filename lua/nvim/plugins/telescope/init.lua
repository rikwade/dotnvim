local actions = require('telescope.actions')

Keybind.g({
    ----------------------------------------------------------------------
    --                          FILES & BUFFER                          --
    ----------------------------------------------------------------------
    -- find a file in current working directory
    {'n', '<c-p>', '<cmd>lua require("telescope.builtin").find_files()<cr>'},

    -- find line in current buffer
    {
        'n',
        '<leader>tf',
        '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>',
    },

    -- find line in current working directory
    {'n', '<leader>tg', '<cmd>lua require("telescope.builtin").live_grep()<cr>'},

    -- find word under the cursor in current buffer
    {
        'n',
        '<leader>*',
        '<cmd>lua require("telescope.builtin").grep_string()<cr>',
    },

    -- find buffer
    {'n', '<c-t>', '<cmd>lua require("telescope.builtin").buffers()<cr>'},

    -- find help index
    {'n', '<leader>th', '<cmd>lua require("telescope.builtin").help_tags()<cr>'},

    -- find register by containing value
    {'i', '<c-r>', '<cmd>lua require("telescope.builtin").registers()<cr>'},

    ----------------------------------------------------------------------
    --                               LSP                                --
    ----------------------------------------------------------------------
    -- find references of word under the cursor
    {
        'n',
        '<leader>tsr',
        ':lua require("telescope.builtin").lsp_references()<cr>',
    },
})

require('telescope').setup()
