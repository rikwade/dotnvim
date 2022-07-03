local Option = require('nvim.utils.nvim.option')

require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = ',s',
            node_incremental = ',s',
            scope_incremental = ',n',
            node_decremental = ',n',
        },
    },

    indent = {
        enable = false,
    },

    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['kt'] = '@function.inner',
                ['ks'] = '@parameter.inner',
                ['ka'] = '@class.inner',

                ['at'] = '@function.outer',
                ['as'] = '@parameter.inner',
                ['aa'] = '@class.outer',
            },
        },

        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']t'] = '@function.outer',
                [']s'] = '@parameter.inner',
                [']a'] = '@class.outer',
            },
            goto_previous_start = {
                ['[t'] = '@function.outer',
                ['[s'] = '@parameter.inner',
                ['[a'] = '@class.outer',
            },
            goto_next_end = {
                [']T'] = '@function.outer',
                [']S'] = '@parameter.inner',
                [']A'] = '@class.outer',
            },
            goto_previous_end = {
                ['[T'] = '@function.outer',
                ['[S'] = '@parameter.inner',
                ['[A'] = '@class.outer',
            },
        },
    },
})

Option.g({
    foldmethod = 'expr',
    foldexpr = 'nvim_treesitter#foldexpr()',
})
