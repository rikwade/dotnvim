local telescope = require('telescope')

telescope.setup({
    defaults = {
        path_display = { 'truncate' },
        file_ignore_patterns = {
            'dist',
            'target',
            'node_modules',
            'pack/plugins',
        },

        mappings = {
            i = {
                ['<C-h>'] = 'which_key',
                ['<C-n>'] = 'move_selection_next',
                ['<C-e>'] = 'move_selection_previous',
            },
        },
    },
})

telescope.load_extension('fzf')
telescope.load_extension('recent_files')
