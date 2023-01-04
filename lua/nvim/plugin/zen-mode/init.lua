return {
	'folke/zen-mode.nvim',
	keys = ',a',
	config = function()
		local wk = require('which-key')
		local laststatus = vim.o.laststatus

		require('zen-mode').setup({
			on_open = function()
				laststatus = vim.o.laststatus
				vim.o.laststatus = 0
			end,
			-- callback where you can add custom code when the Zen window closes
			on_close = function()
				vim.laststatus = laststatus
			end,
		})

		wk.register({
			[',a'] = { '<cmd>ZenMode<CR>', 'Focus mode' },
		})
	end,
}
