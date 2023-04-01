local M = {
	'lewis6991/gitsigns.nvim',
	name = 'gitsigns',
	event = 'BufReadPost',
	version = '0.6',
	cond = function()
		return #vim.fs.find('.git') > 0
	end,
	dependencies = { 'nvim-lua/plenary.nvim' },
}

M.config = {
	signcolumn = true,
	numhl = false,
	linehl = false,
	word_diff = false,
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 1000,
	},
	yadm = {
		enable = false,
	},

	on_attach = function(buffer)
		M.setup_keymaps(buffer)
	end,
}

function M.setup_keymaps(buffer)
	local wk = require('which-key')

	wk.register({
		[']c'] = { M.next_hunk, 'Jump next hunk' },
		['[c'] = { M.prev_hunk, 'Jump prev hunk' },
		['<leader>h'] = {
			name = 'Git',
			t = { M.blame_line, 'Blame line' },
			T = { M.blame_line_with_diff, 'Blame line with diff' },
		},
	}, {
		buffer = buffer,
		expr = true,
	})

	wk.register({
		hh = { ':<C-U>Gitsigns select_hunk<CR>', 'Select hunk' },
		ah = { ':<C-U>Gitsigns select_hunk<CR>', 'Select hunk' },
	}, { mode = { 'o', 'x' }, buffer = buffer })
end

function M.next_hunk()
	if vim.wo.diff then
		return ']c'
	end

	vim.schedule(function()
		require('gitsigns').next_hunk()
	end)

	return '<Ignore>'
end

function M.prev_hunk()
	if vim.wo.diff then
		return '[c'
	end

	vim.schedule(function()
		require('gitsigns').prev_hunk()
	end)

	return '<Ignore>'
end

function M.blame_line()
	require('gitsigns').blame_line({ full = false })
end

function M.blame_line_with_diff()
	require('gitsigns').blame_line({ full = true })
end

return M
