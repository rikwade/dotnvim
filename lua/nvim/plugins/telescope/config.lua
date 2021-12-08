require('telescope').setup({
    defaults = {
        path_display = { 'truncate' },
        file_ignore_patterns = {
            'dist',
            'target',
            'node_modules',
            'pack/plugins',
        },
    },
})
require('telescope').load_extension('fzf')
