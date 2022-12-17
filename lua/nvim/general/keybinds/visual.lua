local wk = require('which-key')

wk.register({
    ['<c-n>'] = { ":m '>+1<CR>gv=gv", 'Move up visual line' },
    ['<c-e>'] = { ":m '<-2<CR>gv=gv", 'Move up visual line' },
}, {
    mode = 'v',
})
