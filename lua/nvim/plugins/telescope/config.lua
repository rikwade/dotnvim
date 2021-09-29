R'telescope'.setup(
    {
        defaults = {
            path_display = { 'truncate', 'tail' },
            file_ignore_patterns = {},
        },
    })
R'telescope'.load_extension('fzf')
