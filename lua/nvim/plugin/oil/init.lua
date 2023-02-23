return {
	'stevearc/oil.nvim',
	keys = '<leader>oo',
	config = function()
		local wk = require('which-key')

		require('oil').setup()

		wk.register({
			['<leader>oo'] = {
				require('oil').open,
				'Open oil file explorer',
			},
		})
	end,
}
