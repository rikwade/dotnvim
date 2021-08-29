local l = Keybind.get_lua_cmd_string
local actions = R 'telescope.actions'

Keybind.g({
    ----------------------------------------------------------------------
    --                          FILES & BUFFER                          --
    ----------------------------------------------------------------------
    -- find a file in current working directory
    {'n', '<c-p>', l 'R"telescope.builtin".find_files()'},

    -- find line in current buffer
    {'n', '<leader>tf', l 'R"telescope.builtin".current_buffer_fuzzy_find()'},

    -- find line in current working directory
    {'n', '<leader>tg', l 'R"telescope.builtin".live_grep()'},

    -- find word under the cursor in current buffer
    {'n', '<leader>*', l 'R"telescope.builtin".grep_string()'},

    -- find buffer
    {'n', '<c-t>', l 'R"telescope.builtin".buffers()'},

    -- find help index
    {'n', '<leader>th', l 'R"telescope.builtin".help_tags()'},

    -- find register by containing value
    {'i', '<c-r>', l 'R"telescope.builtin".registers()'},

    ----------------------------------------------------------------------
    --                               LSP                                --
    ----------------------------------------------------------------------
    -- find references of word under the cursor
    {'n', '<leader>tsr', l 'R"telescope.builtin".lsp_references()'},
})

R'telescope'.setup()
