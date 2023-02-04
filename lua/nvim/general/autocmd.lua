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
		-- skip if a pop up window
		if vim.fn.win_gettype() == 'popup' then
			return
		end

		-- skip if new buffer
		if vim.bo.filetype == '' then
			return
		end

		vim.opt.winbar = "%{%v:lua.require'nvim.utils.nvim.winbar'.eval()%}"
	end,
})

-- open terminals in insert mode
vim.api.nvim_create_autocmd({ 'BufWinEnter', 'TermOpen' }, {
	pattern = 'term://*',
	command = 'startinsert',
})

-- show cursor column and line on window enter
vim.api.nvim_create_autocmd('WinEnter', {
	callback = function()
		vim.wo.cursorcolumn = true
		vim.wo.cursorline = true
	end
})

-- remove cursor column and line on window leave
vim.api.nvim_create_autocmd('WinLeave', {
	callback = function()
		vim.wo.cursorcolumn = false
		vim.wo.cursorline = false
	end
})

-- format on save
--  vim.api.nvim_create_autocmd('BufWritePost', {
--  pattern = '*',
--  callback = function()
--  local buffer = vim.api.nvim_get_current_buf()

--  for _, client in ipairs(vim.lsp.get_active_clients()) do
--  if client.attached_buffers[buffer] then
--  vim.lsp.buf.format()
--  end
--  end
--  end,
--  })
