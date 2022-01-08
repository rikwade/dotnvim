local Shortcut = require('nvim.utils.nvim.shortcut')

require('neo-tree').setup({
    filesystem = {
        window = {
            mappings = {
                ['o'] = 'open',
                ['<c-c>'] = ':NeoTreeClose'
            },
        },
    },
})

Shortcut:options():noremap():next():mode('n'):keymaps({
    { '\\', ':NeoTreeFloat<cr>' },
})
