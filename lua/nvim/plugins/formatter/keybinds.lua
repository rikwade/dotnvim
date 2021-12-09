local Shortcut = require('nvim.utils.nvim.shortcut')

Shortcut:options():silent():noremap():next():mode('n'):keymaps({
    { ',f', ':Format<CR>' },
})
