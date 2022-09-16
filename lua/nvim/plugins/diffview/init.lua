local Shortcut = require('nvim.utils.nvim.shortcut')

Shortcut()
    :mode('n')
    :options()
    :description('DiffView')
    :next()
    :add_all({
        {
            '<leader>hd',
            '<cmd>DiffviewFileHistory %<cr>',
            { desc = 'Show diff in the current file' },
        },
        {
            '<leader>hD',
            '<cmd>DiffviewFileHistory<cr>',
            { desc = 'Show diff in the current branch' },
        },
    })
    :mode('v')
    :add_all({
        {
            '<leader>hd',
            ':DiffviewFileHistory<cr>',
            { desc = 'Show diff for the current selection' },
        },
    })
