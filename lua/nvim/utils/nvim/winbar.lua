local ThemeManager = require('nvim.utils.nvim.theme.theme-manager')
local HighlightGroup = require('nvim.utils.nvim.highlighting.highlight-groups')
local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')

local theme = ThemeManager.get_theme()

local M = {}

local highlights = HighlightGroup({
    WinBarSeparator = { guifg = theme.bright.white },
    WinBarContent = { guifg = theme.bright.black, guibg = theme.bright.white },
})

Highlighter:new():add(highlights):register_highlights()

-- vim.api.nvim_set_hl(0, 'WinBarSeparator', { fg = colors.grey })
-- vim.api.nvim_set_hl(0, 'WinBarContent', { fg = colors.green, bg = colors.grey })

M.eval = function()
    local file_name = vim.api.nvim_eval_statusline('%f', {}).str

    file_name = file_name:gsub('/', ' ➤ ')

    return '%#WinBarSeparator#'
        .. ''
        .. '%*'
        .. '%#WinBarContent#'
        .. file_name
        .. '%*'
        .. '%#WinBarSeparator#'
        .. ''
        .. '%*'
end

return M
