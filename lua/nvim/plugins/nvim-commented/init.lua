R'commented'.setup {
    hooks = {
        before_comment = require('ts_context_commentstring.internal').update_commentstring,
    },
    comment_padding = ' ',
    keybindings = { n = ',c', v = ',c', nl = ',c' },
    prefer_block_comment = false,
    set_keybindings = true,
    ex_mode_cmd = 'Comment',
}
