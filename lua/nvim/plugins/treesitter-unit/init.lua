local Shortcut = require('nvim.utils.nvim.shortcut')

Shortcut
    :options()
    :noremap()
    :next()
    :mode('x')
    :keymaps({
        { 'iu', ':lua require"treesitter-unit".select()<CR>' },
        { 'au', ':lua require"treesitter-unit".select(true)<CR>' },
    })
    :mode('o')
    :keymaps({
        { 'u', ':<c-u>lua require"treesitter-unit".select()<CR>' },
        { 'au', ':<c-u>lua require"treesitter-unit".select(true)<CR>' },
    })
