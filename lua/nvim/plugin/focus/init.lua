local split = function(direction)
	return function()
		require('focus').split_command(direction)
	end
end

return {
	'beauwilliams/focus.nvim',
	name = 'focus',
	event = 'VeryLazy',
	config = function()
		require('focus').setup()
		require('which-key').register({
			m = { split('h'), 'Split left' },
			i = { split('l'), 'Split right' },
			n = { split('j'), 'Split down' },
			e = { split('k'), 'Split up' },
		}, { prefix = '<tab>' })
	end,
}
