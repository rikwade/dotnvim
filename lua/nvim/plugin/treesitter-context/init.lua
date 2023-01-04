return {
	'romgrk/nvim-treesitter-context',
	event = 'BufReadPost',
	requires = { 'treesitter' },
	config = { enable = true, throttle = true },
}
