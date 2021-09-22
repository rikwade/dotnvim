local Shortcut = R'nvim.newutil.keymap'.Shortcut
local cmp = R 'cmp'

cmp.setup(
    {
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm(
                {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }),
        },

        sources = {
            {
                name = 'snippy',
                priority = 90,
                max_item_count = 3,
                keyword_length = 2,
            },
            {
                name = 'nvim_lsp',
                priority = 100,
            },
            {
                name = 'nvim_lua',
                priority = 100,
            },
            {
                name = 'buffer',
                priority = 80,
            },
            {
                name = 'path',
                priority = 80,
            },
            {
                name = 'spell',
                priority = 50,
            },
            {
                name = 'calc',
                priority = 50,
            },
            {
                name = 'emoji',
                priority = 10,
            },
        },

        snippet = {
            expand = function(args)
                R'snippy'.expand_snippet(args.body)
            end,
        },
        completion = {
            keyword_length = 5,
        },
        preselect = true,
    })

Shortcut:keymaps():map({ { '<c-e>', cmp.mapping.close } })
