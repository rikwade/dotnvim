local class = require('pl.class')
local ls = require('luasnip')
local Shortcut = require('nvim.utils.nvim.shortcut')
local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')
local HighlightGroups = require('nvim.utils.nvim.highlighting.highlight-groups')

local highlighter = Highlighter:new():add(HighlightGroups({
    LuaSnipChoiseNode = 'guifg=#f0a535',
    LuaSnipActiveNode = 'guifg=#49e635',
}))

highlighter:register_highlights()

local M = class()

-- M:new creates a snippet manager instance
function M:_init(language)
    self.language = language
end

-- M:add_snippet adds a new snippet
function M:add_snippet(snippet)
    ls.add_snippets(self.language, { snippet })
end

-- M.setup initialize basic keymaps
function M.setup()
    ls.config.setup({
        updateevents = 'TextChanged,TextChangedI',
    })

    Shortcut()
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
                        ls.change_choice()
                    end
                end,
            },
        })
        :mode('n')
        :keymap('<leader><leader>s', function()
            require('nvim.utils.common.module').unload_package(
                'nvim.plugins.luasnip.snippets'
            )

            require('nvim.plugins.luasnip.snippets').setup()
        end)
end

return M
