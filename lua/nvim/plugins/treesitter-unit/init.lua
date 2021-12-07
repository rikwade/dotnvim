Keybind.g({
    {
        'x',
        'iu',
        ':lua require"treesitter-unit".select()<CR>',
        { noremap = true },
    },
    {
        'x',
        'au',
        ':lua require"treesitter-unit".select(true)<CR>',
        { noremap = true },
    },
    {
        'o',
        'u',
        ':<c-u>lua require"treesitter-unit".select()<CR>',
        { noremap = true },
    },
    {
        'o',
        'au',
        ':<c-u>lua require"treesitter-unit".select(true)<CR>',
        { noremap = true },
    },
})
