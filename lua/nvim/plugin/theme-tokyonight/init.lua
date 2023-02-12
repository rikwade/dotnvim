return {
	'folke/tokyonight.nvim',
	name = 'theme',
	event = 'VeryLazy',
	enabled = true,
	config = function()
		require("tokyonight").setup({ style = 'moon' })
		vim.cmd('colorscheme tokyonight')
	end
}
