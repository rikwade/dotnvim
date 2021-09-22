R'nvim-treesitter.configs'.setup(
    {
        ensure_installed = 'all',

        highlight = {
            enable = true,
        },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = 'gnn',
                node_incremental = 'gnn',
                scope_incremental = 'gnc',
                node_decremental = 'gnd',
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
                    ['af'] = '@function.outer',
                    ['f'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',

                    -- Or you can define your own textobjects like this
                    ['iF'] = {
                        python = '(function_definition) @function',
                        cpp = '(function_definition) @function',
                        c = '(function_definition) @function',
                        java = '(method_declaration) @function',
                    },
                },
            },

            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    [']f'] = '@function.outer',
                    [']]'] = '@class.outer',
                },
                goto_next_end = {
                    [']F'] = '@function.outer',
                    [']['] = '@class.outer',
                },
                goto_previous_start = {
                    ['[f'] = '@function.outer',
                    ['[['] = '@class.outer',
                },
                goto_previous_end = {
                    ['[F'] = '@function.outer',
                    ['[]'] = '@class.outer',
                },
            },
        },
    })

API.nvim_exec(
    [[

	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()

]], false)
