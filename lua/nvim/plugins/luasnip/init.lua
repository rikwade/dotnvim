local Shortcut = require('nvim.utils.nvim.shortcut')
local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')
local HighlightGroups = require('nvim.utils.nvim.highlighting.highlight-groups')
local ls = require('luasnip')
local types = require('luasnip.util.types')

local highlighter = Highlighter:new():add(HighlightGroups({
    LuaSnipChoiseNode = 'guifg=#f0a535',
    LuaSnipActiveNode = 'guifg=#49e635',
}))

highlighter:register_highlights()

ls.config.setup({
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { '●', 'LuaSnipChoiseNode' } },
            },
        },
        [types.insertNode] = {
            active = {
                virt_text = { { '●', 'LuaSnipActiveNode' } },
            },
        },
    },
})

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
    :keymap('<leader><leader>s', function()
        local ModuleCommon = require('nvim.utils.common.module')
        ModuleCommon.reload_package('nvim.plugins.luasnip.snippets')
    end)
