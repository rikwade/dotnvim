local telescope = require('telescope')
local action = require('telescope.actions')

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
                ['<C-h>'] = action.which_key,
                ['<C-n>'] = action.move_selection_next,
                ['<C-e>'] = action.move_selection_previous,
                ['<C-c>'] = action.close,
                ['<esc>'] = action.close,
            },
        },
    },
    extensions = {
        recent_files = {
            only_cwd = true,
        },
    },
})

telescope.load_extension('fzf')
