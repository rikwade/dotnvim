local Shortcut = require('nvim.utils.nvim.shortcut')
local ls = require('luasnip')

Shortcut
    :mode({ 'i', 's' })
    :keymaps({
        {
            '<m-i>',
            function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end,
        },
        {
            '<c-h>',
            function()
                if ls.jumpable(1) then
                    ls.jump(1)
                end
            end,
        },
        {
            '<c-n>',

            function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end,
        },
        {
            '<c-l>',
            function()
                if ls.choice_active() then
                    ls.choice_active(1)
                end
            end,
        },
    })
    :mode('n')
    :keymap(
        '<leader><leader>s',
        '<cmd>source ~/.config/nvim/lua/nvim/plugins/luasnip/snippets/init.lua<cr>'
    )
