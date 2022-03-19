local Shortcut = require('nvim.utils.nvim.shortcut')

Shortcut:mode('v'):options():noremap():next():keymaps({

    -- down arrow key
    { 'n', 'j' },

    -- up arrow key
    { 'e', 'k' },

    -- right arrow key
    { 'i', 'l' },

    -- word end
    { 'l', 'e' },
})
