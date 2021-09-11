Keybind.g({
    -- [ j + j ] to go to normal mode
    {'t', 'jj', [[<c-\><c-n>]], {}},

    -- [ ctrl + k ] to change the window from terminal
    {'t', '<c-k>', [[<c-\><c-n><c-w>k]], {}},

    -- [ ctrl + j ] move cursor to bottom window from terminal
    {'t', '<c-j>', [[<c-\><c-n><c-w>j]], {}},

    -- [ ctrl + h ] move cursor to left window from terminal
    {'t', '<c-j>', [[<c-\><c-n><c-w>h]], {}},

    -- [ ctrl + l ] move cursor to right window from terminal
    {'t', '<c-j>', [[<c-\><c-n><c-w>l]], {}},
})
