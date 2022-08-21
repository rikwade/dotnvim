local Shortcut = require('nvim.utils.nvim.shortcut')

local laststatus = vim.o.laststatus

require('zen-mode').setup({
    on_open = function()
        laststatus = vim.o.laststatus
        vim.o.laststatus = 0
    end,
    -- callback where you can add custom code when the Zen window closes
    on_close = function()
        vim.laststatus = laststatus
    end,
})

Shortcut():mode('n'):keymap('.a', ':ZenMode<CR>')
