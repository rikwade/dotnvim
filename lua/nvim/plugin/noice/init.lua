return {
	'folke/noice.nvim',
	event = 'VeryLazy',
	dependencies = {
		'MunifTanjim/nui.nvim',
		'rcarriga/nvim-notify',
	},
	version = '1.5.2',
	config = {
		lsp = {
			hover = {
				enabled = false,
			},
			signature = {
				enabled = false,
			},
		},
	},
}
