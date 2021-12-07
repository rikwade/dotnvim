R('telescope').setup({
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
R('telescope').load_extension('fzf')
