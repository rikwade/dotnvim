return {
	's1n7ax/nvim-terminal',
	keys = {
		'<m-\\>',
	},
	config = function()
		local wk = require('which-key')

		require('nvim-terminal').setup({
			increase_width_keymap = '',
			decrease_width_keymap = '',
		})

		wk.register({
			['<m-\\>'] = {
				function()
					---@diagnostic disable-next-line: 113
					NTGlobal['terminal']:toggle()
				end,
				'Toggle terminal',
			},
		}, {
			mode = { 'n', 'i', 't' },
		})
	end,
}
