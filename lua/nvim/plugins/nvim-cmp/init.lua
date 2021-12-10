local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup({})

local v = vim
local WIDE_HEIGHT = 20

cmp.setup({
    mapping = {
        ['<C-e>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-l>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },

    sources = {
        {
            name = 'nvim_lsp',
            priority = 100,
        },
        {
            name = 'nvim_lua',
            priority = 100,
        },
        {
            name = 'snippy',
            priority = 90,
            max_item_count = 5,
            keyword_length = 2,
        },
        {
            name = 'buffer',
            priority = 80,
            max_item_count = 5,
            keyword_length = 4,
        },
        {
            name = 'path',
            priority = 80,
        },
        {
            name = 'spell',
            max_item_count = 5,
            priority = 50,
        },
        {
            name = 'calc',
            priority = 50,
        },
        {
            name = 'emoji',
            max_item_count = 5,
            priority = 10,
        },
    },

    snippet = {
        expand = function(args)
            require('snippy').expand_snippet(args.body)
        end,
    },

    completion = {
        keyword_length = 2,
        completeopt = 'menu,menuone,preview,noinsert',
    },

    preselect = false,

    documentation = {
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
        maxwidth = math.floor(WIDE_HEIGHT * (v.o.columns / 100)),
        maxheight = math.floor(WIDE_HEIGHT * (v.o.lines / 100)),
    },

    -- Adds source of completion
    -- this is a part of onsails/lspkind-nvim plugin
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
        }),
    },
})
