return {
	's1n7ax/nvim-terminal',
	keys = {
		'<c-\\>',
	},
	config = function()
		local wk = require('which-key')

		require('nvim-terminal').setup({
			increase_width_keymap = '',
			decrease_width_keymap = '',
		})

		wk.register({
			['<c-\\>'] = {
				function()
					---@diagnostic disable-next-line: undefined-global
					NTGlobal['terminal']:toggle()
				end,
				'Toggle terminal',
			},
		}, {
			mode = { 'n', 't' },
		})
	end,
}
