return {
	'catppuccin/nvim',
	name = 'catppuccin',
	event = 'VimEnter',
	config = function()
		vim.g.catppuccin_flavour = 'mocha'
		require('catppuccin').setup({
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				telescope = false,
				notify = false,
				mini = false,
			},
		})

		vim.cmd('colorscheme catppuccin')
	end,
}
