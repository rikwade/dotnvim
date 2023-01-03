return {
	'phaazon/hop.nvim',
	name = 'hop',
	keys = { '8f', '8w' },
	config = function()
		require('hop').setup({ keys = 'tnseriaocmfuplwyq' })
		local wk = require('which-key')

		wk.register({
			['8f'] = { ':HopChar1<CR>', 'Hop word by char' },
			['8w'] = { ':HopWord<CR>', 'Hop word' },
		})
	end,
}
