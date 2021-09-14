R'winshift'.setup {
    highlight_moving_win = true,
    focused_hl_group = 'Visual',
    moving_win_options = {
        wrap = false,
        cursorline = false,
        cursorcolumn = false,
        colorcolumn = '',
    },
}

Keybind.g({ { 'n', '<c-w>m', '<cmd>WinShift<cr>' } })
