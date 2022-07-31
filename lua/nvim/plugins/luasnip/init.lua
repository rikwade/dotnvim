local ls = require('luasnip')
local Shortcut = require('nvim.utils.nvim.shortcut')
local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')
local HighlightGroups = require('nvim.utils.nvim.highlighting.highlight-groups')
local ThemeManager = require('nvim.utils.nvim.theme.theme-manager')
local FiletypeEvent = require('nvim.utils.nvim.filetype-event')

local theme = ThemeManager.get_theme()

local highlighter = Highlighter:new():add(HighlightGroups({
    LuaSnipChoiseNode = { guifg = theme.bright.yellow },
    LuaSnipActiveNode = { guifg = theme.bright.green },
}))

highlighter:register_highlights()

local languages = {
    'lua',
}

local M = {}

function M.register_snippets()
    for _, language in pairs(languages) do
        FiletypeEvent.on_filetype_open(language, function()
            require(string.format('nvim.plugins.luasnip.snippets.%s', language)).setup()
        end)
    end
end

-- M.setup initialize basic keymaps
function M.setup()
    M.register_snippets()

    ls.config.setup({
        updateevents = 'TextChanged,TextChangedI',
    })

    Shortcut()
        :mode({ 'i', 's' })
        :keymaps({
            {
                '<c-i>',
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