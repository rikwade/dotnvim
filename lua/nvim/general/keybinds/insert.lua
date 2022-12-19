local wk = require('which-key')

wk.register({
    ['<c-a>'] = { '<esc>I', '(Insert) Jump to line start' },
    ['<c-o>'] = { '<esc>A', '(Insert) Jump to line end' },
}, {
    mode = 'i',
})
