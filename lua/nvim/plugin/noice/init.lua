return {
	'folke/noice.nvim',
	event = 'VeryLazy',
	version = '1.8.2',
	dependencies = {
		'MunifTanjim/nui.nvim',
		'rcarriga/nvim-notify',
	},
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
