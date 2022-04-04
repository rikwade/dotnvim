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
                { 'current_filter' },
                { 'name' },
                {
                    'clipboard',
                    highlight = 'NeoTreeDimText',
                },
                { 'diagnostics', errors_only = true },
            },
        },
    },
})

Shortcut():options():noremap():next():mode('n'):keymaps({
    { '\\', ':NeoTreeFocusToggle<cr>' },
})
