local Shortcut = R('nvim.newutil.keymap')

Shortcut:mode('x'):options():noremap():next():keymaps({

    -- down arrow key
    { 'n', 'j' },

    -- up arrow key
    { 'e', 'k' },

    -- right arrow key
    { 'i', 'l' },

    -- word end
    { 'l', 'e' },
})
