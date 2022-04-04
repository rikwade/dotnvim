local Shortcut = require('nvim.utils.nvim.shortcut')

require('hop').setup({ keys = 'tnseriaocmfuplwyq' })

Shortcut():mode('n'):options():noremap():silent():next():keymaps({
    { '8f', ':HopChar1<CR>' },
    { '8w', ':HopWord<CR>' },
})
