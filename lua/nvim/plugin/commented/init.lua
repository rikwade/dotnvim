return {
	'winston0410/commented.nvim',
	dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
	keys = {
		',c',
		{ ',c', mode = 'v' },
	},
	config = {
		comment_padding = ' ',
		keybindings = {
			n = ',c',
			v = ',c',
			nl = ',cc',
		},
		prefer_block_comment = false,
		set_keybindings = true,
		ex_mode_cmd = 'Comment',
	},
}
