local Shortcut = require('nvim.utils.nvim.shortcut')

Shortcut:mode(''):options():noremap():next():keymaps({
    ----------------------------------------------------------------------
    --                           CURSOR MOVE                            --
    ----------------------------------------------------------------------
    { 'n', 'j' },

    { 'e', 'k' },

    { 'i', 'l' },

    { 'l', 'e' },

    { 'k', 'n' },
})
