local Shortcut = require('nvim.utils.nvim.shortcut')

require('neo-tree').setup({
    filesystem = {
        window = {
            mappings = {
                ['o'] = 'open',
            },
        },
        renderers = {
            directory = {
                {
                    'icon',
                    default = '',
                    folder_closed = ' ',
                    folder_open = ' ',
                    padding = ' ',
                },
            },
        },
    },
})

Shortcut:options():noremap():next():mode('n'):keymaps({
    { '\\', ':NeoTreeFloat<cr>' },
})
