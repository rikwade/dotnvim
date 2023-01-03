return {
	'nvim-treesitter/nvim-treesitter',
	name = 'treesitter',
	build = ':TSUpdate',
	event = 'BufEnter',
	dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
	config = function()
		require('nvim.plugin.treesitter.config')
		require('nvim.plugin.treesitter.query')
	end,
}
