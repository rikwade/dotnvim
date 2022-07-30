local ThemeManager = require('nvim.utils.nvim.theme.theme-manager')
local HighlightGroup = require('nvim.utils.nvim.highlighting.highlight-groups')
local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')

local Theme = ThemeManager.get_theme()

local group = HighlightGroup({
    IndentBlanklineIndent1 = { fg = Theme.normal.black },
    IndentBlanklineIndent2 = { fg = Theme.normal.red },
    IndentBlanklineIndent3 = { fg = Theme.normal.green },
    IndentBlanklineIndent4 = { fg = Theme.normal.yellow },
    IndentBlanklineIndent5 = { fg = Theme.normal.blue },
    IndentBlanklineIndent6 = { fg = Theme.normal.magenta },
})

Highlighter:new():add(group):register_highlights()

require('indent_blankline').setup({
    space_char_blankline = ' ',
    char_highlight_list = {
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent2',
        'IndentBlanklineIndent3',
        'IndentBlanklineIndent4',
        'IndentBlanklineIndent5',
        'IndentBlanklineIndent6',
    },
})
