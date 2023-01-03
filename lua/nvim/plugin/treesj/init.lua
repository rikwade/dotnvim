return {
	'Wansmer/treesj',
	dependencies = { 'treesitter' },
	keys = { '<leader>ot' },
	config = function()
		local wk = require('which-key')
		local tsj = require('treesj')

		tsj.setup({
			use_default_keymaps = false,
		})

		wk.register({
			o = {
				name = 'Other',
				t = { tsj.toggle, 'Spread/collapse block' },
			},
		}, {
			prefix = '<leader>',
		})
	end,
}
