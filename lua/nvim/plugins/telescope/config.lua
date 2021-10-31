R'telescope'.setup(
    {
        defaults = {
            path_display = { 'truncate' },
            file_ignore_patterns = { 'dist', 'target' },
        },
    })
R'telescope'.load_extension('fzf')
