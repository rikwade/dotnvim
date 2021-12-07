local Shortcut = R('nvim.newutil.keymap')

Shortcut:mode('t'):options():noremap():next():keymaps({
    -- to go to normal mode
    { 'nn', [[<c-\><c-n>]], {} },
})
