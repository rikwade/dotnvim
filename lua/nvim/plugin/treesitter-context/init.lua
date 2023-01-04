return {
	'romgrk/nvim-treesitter-context',
	event = 'BufAdd',
	requires = { 'treesitter' },
	config = { enable = true, throttle = true },
}
