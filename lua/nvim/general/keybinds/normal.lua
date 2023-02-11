local common = require('nvim.utils.common.module')
local window = require('nvim.utils.nvim.window')
local wk = require('which-key')
local browser = require('nvim.utils.nvim.browser')

----------------------------------------------------------------------
--                              CONFIG                              --
----------------------------------------------------------------------
wk.register({
	r = {
		function()
			common.reload_package('nvim')
		end,
		'Reload config',
	},
}, {
	prefix = '<tab>',
})

----------------------------------------------------------------------
--                           CURSOR MOVE                            --
----------------------------------------------------------------------
wk.register({
	['<c-m>'] = { '<c-w>h', 'Jump left window' },
	['<c-i>'] = { '<c-w>l', 'Jump right window' },
	['<c-n>'] = { '<c-w>j', 'Jump bottom window' },
	['<c-e>'] = { '<c-w>k', 'Jump top window' },
	['<c-w><c-w>'] = { '<c-w>p', 'Jump to last window' },

	["''"] = { '``zz', 'Jump to last jump point' },

	['0'] = { '^', 'Jump to line start (non-blank)' },

	-- centering the cursor after action
	['{'] = { '{zz', 'Previous empty line' },
	['}'] = { '}zz', 'Next empty line' },
	['<c-d>'] = { '<c-d>zz', 'Scroll down' },
	['<c-u>'] = { '<c-u>zz', 'Scroll up' },
	['G'] = { 'Gzz', 'Last line' },

	['<c-l>'] = { '<c-i>', 'Jump prev jump point' },
}, {})

----------------------------------------------------------------------
--                        BUFFER READ WRITE                         --
----------------------------------------------------------------------
wk.register({
	[',w'] = { '<cmd>silent w<cr>', 'Save file' },
	[',q'] = { '<cmd>q<cr>', 'Close window' },
	[',Q'] = { '<cmd>tabclose<cr>', 'Close tab' },
})

----------------------------------------------------------------------
--                        TEXT MANIPULATIONS                        --
----------------------------------------------------------------------
wk.register({
	['[<space>'] = {
		function()
			local curr_line = vim.api.nvim_win_get_cursor(0)[1]

			vim.api.nvim_buf_set_lines(
				0,
				curr_line - 1,
				curr_line - 1,
				true,
				{ '' }
			)
		end,
		'Add line above',
	},
	[']<space>'] = {
		function()
			local curr_line = vim.api.nvim_win_get_cursor(0)[1]
			vim.api.nvim_buf_set_lines(0, curr_line, curr_line, true, { '' })
		end,
		'Add line below',
	},
})

----------------------------------------------------------------------
--                      BUFFER & WINDOW SWITCH                      --
----------------------------------------------------------------------
wk.register({
	gf = {
		require('nvim.utils.nvim.file').open_file_under_cursor,
		'Open file on cursor',
	},

	gF = { 'gf', 'Open file on cursor (same window)' },

	gx = {
		function()
			browser.open_or_search(vim.fn.expand('<cfile>'))
		end,
		'Open or search on browser',
	},
})

----------------------------------------------------------------------
--                           SPLIT WINDOW                           --
----------------------------------------------------------------------
wk.register({
	name = 'Split window',
	m = { window.split_left, 'Split left' },
	n = { window.split_bottom, 'Split bottom' },
	e = { window.split_top, 'Split top' },
	i = { window.split_right, 'Split right' },
}, {
	prefix = '<tab>'
})

wk.register({
	name = 'Clipboard & Registers',
	['<leader>'] = {
		p = '"+p'
	}
})

----------------------------------------------------------------------
--                              OTHER                               --
----------------------------------------------------------------------
wk.register({
	-- to go enable spell checker
	['<F6>'] = { '<cmd>setlocal spell! spelllang=en_us<cr>', 'Toggle spell' },
	['<leader>on'] = { browser.google_search, 'Google search' },
})
