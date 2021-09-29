R'telescope'.setup(
    {
        defaults = {
            path_display = { 'truncate' },
            file_ignore_patterns = {},
        },
    })
R'telescope'.load_extension('fzf')
