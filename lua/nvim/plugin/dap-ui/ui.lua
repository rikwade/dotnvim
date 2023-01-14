local ThemeManager = require('nvim.utils.nvim.theme.theme-manager')
local highlights = require('nvim.utils.nvim.hl')

local theme = ThemeManager.get_theme()

local reg_hl = highlights({
	DapBreakpoint = { fg = theme.bright.red },
	DapBreakpointRejected = { fg = theme.bright.yellow },
	DapStopped = { fg = theme.bright.cyan },
	DapLogPoint = { fg = theme.bright.blue },
	DapStoppedCursorLine = { fg = theme.normal.green },
})

reg_hl()

vim.fn.sign_define('DapBreakpoint', {
	text = '',
	texthl = 'DapBreakpoint',
	linehl = 'CursorLine',
	numhl = 'DapBreakpoint',
})

vim.fn.sign_define('DapBreakpointRejected', {
	text = '',
	texthl = 'DapBreakpointRejected',
	linehl = '',
	numhl = 'DapBreakpointRejected',
})

vim.fn.sign_define('DapStopped', {
	text = '',
	texthl = 'DapStopped',
	linehl = 'DapStoppedCursorLine',
	numhl = 'DapStopped',
})

vim.fn.sign_define('DapLogPoint', {
	text = '﬌',
	texthl = 'DapLogPoint',
	linehl = '',
	numhl = 'DapLogPoint',
})
