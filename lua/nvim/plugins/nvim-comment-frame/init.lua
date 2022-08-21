local Shortcut = require('nvim.utils.nvim.shortcut')

require('nvim-comment-frame').setup({ disable_default_keymap = true })

Shortcut()
    :mode('n')
    :keymap('.c', require('nvim-comment-frame').add_comment)
