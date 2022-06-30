local Shortcut = require('nvim.utils.nvim.shortcut')

require('winshift').setup({
    keymaps = {
        disable_defaults = true, -- Disable the default keymaps
        win_move_mode = {
            ['h'] = 'left',
            ['n'] = 'down',
            ['e'] = 'up',
            ['i'] = 'right',
            ['H'] = 'far_left',
            ['N'] = 'far_down',
            ['E'] = 'far_up',
            ['I'] = 'far_right',
            ['<left>'] = 'left',
            ['<down>'] = 'down',
            ['<up>'] = 'up',
            ['<right>'] = 'right',
            ['<S-left>'] = 'far_left',
            ['<S-down>'] = 'far_down',
            ['<S-up>'] = 'far_up',
            ['<S-right>'] = 'far_right',
        },
    },
})

Shortcut():mode('n'):options():noremap():next():keymaps({
    { '<c-w>m', '<cmd>WinShift<cr>' },
})
