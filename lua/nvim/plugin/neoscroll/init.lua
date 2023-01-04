return {
	'tobdob/neoscroll.nvim',
	branch = 'time-scale',
	event = 'BufAdd',
	enabled = false,
	config = {
		mappings = {
			'<C-u>',
			'<C-d>',
			'zt',
			'zz',
			'zb',
		},
		time_scale = 0.5,
	},
}
