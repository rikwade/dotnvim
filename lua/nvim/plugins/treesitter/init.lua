R'nvim-treesitter.configs'.setup(
    {
        ensure_installed = 'all',

        highlight = {
            enable = true,
        },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = ',t',
                node_incremental = ',t',
                scope_incremental = ',s',
                node_decremental = ',r',
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
                    ['t'] = '@function.inner',
                    ['is'] = '@parameter.inner',
                    ['ia'] = '@class.inner',
                    -- @todo @block.inner does not work
                    ['ir'] = '@block.outer',

                    ['at'] = '@function.outer',
                    ['as'] = '@parameter.inner',
                    ['aa'] = '@class.outer',
                    ['ar'] = '@block.outer',
                },
            },

            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    [']t'] = '@function.outer',
                    [']s'] = '@parameter.inner',
                    [']r'] = '@block.outer',
                    [']a'] = '@class.outer',
                },
                goto_previous_start = {
                    ['[t'] = '@function.outer',
                    ['[s'] = '@parameter.inner',
                    ['[r'] = '@block.outer',
                    ['[a'] = '@class.outer',
                },
                goto_next_end = {
                    [']T'] = '@function.outer',
                    [']S'] = '@parameter.inner',
                    [']R'] = '@block.outer',
                    [']A'] = '@class.outer',
                },
                goto_previous_end = {
                    ['[T'] = '@function.outer',
                    ['[S'] = '@parameter.inner',
                    ['[R'] = '@block.outer',
                    ['[A'] = '@class.outer',
                },
            },
        },
    })

API.nvim_exec(
    [[
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
  ]], false)
