local ThemeManager = require('nvim.utils.nvim.theme.theme-manager')
local HighlightGroups = require('nvim.utils.nvim.highlighting.highlight-groups')
local highlighter = require('nvim.utils.nvim.highlighting.highlighter')

local theme = ThemeManager.get_theme()

local highlight_groups = HighlightGroups({
    TextYank = { guibg = theme.normal.yellow, guifg = theme.normal.black },
})

highlighter:new():add(highlight_groups):register_highlights()

-- highlight text on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = highlight_groups.TextYank.name,
            timeout = 300,
            on_visual = true,
        })
    end,
})

-- set the winbar
vim.api.nvim_create_autocmd('BufWinEnter', {
    pattern = '*',
    callback = function()
        if vim.bo.filetype == '' then
            return
        end

        vim.wo.winbar = "%{%v:lua.require'nvim.utils.nvim.winbar'.eval()%}"
    end,
})

-- format on save
vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = '*',
    callback = function()
        local buffer = vim.api.nvim_get_current_buf()

        for _, client in ipairs(vim.lsp.get_active_clients()) do
            if client.attached_buffers[buffer] then
                vim.lsp.buf.format()
            end
        end
    end,
})
