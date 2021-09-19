local Shortcut = R'nvim.newutil.keymap'.Shortcut

Shortcut:mode(''):options():noremap():next():keymaps():map(
    {
        ----------------------------------------------------------------------
        --                           CURSOR MOVE                            --
        ----------------------------------------------------------------------
        { 'n', 'j' },

        { 'e', 'k' },

        { 'i', 'l' },

        { 'l', 'e' },

        { 'k', 'n' },
    })
