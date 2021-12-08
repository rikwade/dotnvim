local Shortcut = require('nvim.utils.nvim.shortcut')

require('winshift').setup({
    highlight_moving_win = true,
    focused_hl_group = 'Visual',
    moving_win_options = {
        wrap = false,
        cursorline = false,
        cursorcolumn = false,
        colorcolumn = '',
    },
})

Shortcut:mode('n'):options():noremap():next():keymaps({
    { '<c-w>m', '<cmd>WinShift<cr>' },
})
