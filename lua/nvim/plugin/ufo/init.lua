return {
	'kevinhwang91/nvim-ufo',
	dependencies = 'kevinhwang91/promise-async',
	event = { 'BufReadPost' },
	config = function()
		local wk = require('which-key')

		wk.register({
			z = {
				R = { require('ufo').openAllFolds, 'Open all folds' },
				M = { require('ufo').closeAllFolds, 'Close all folds' },
			},
		})

		require('ufo').setup()
	end,
}
