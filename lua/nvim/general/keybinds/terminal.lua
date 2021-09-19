local Shortcut = R'nvim.newutil.keymap'.Shortcut

Shortcut:mode('t'):options():noremap():next():keymaps():map(
    {
        -- to go to normal mode
        { 'nn', [[<c-\><c-n>]], {} },
    })
