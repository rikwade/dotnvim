return {
	'L3MON4D3/LuaSnip',
	name = 'luasnip',
	event = 'BufReadPre',
	dependencies = { 'treesitter' },
	config = function()
		local helper = require('nvim.plugin.luasnip.helper')

		require('luasnip').config.setup({
			updateevents = 'TextChanged,TextChangedI',
		})

		helper.register_snippets()
		helper.set_highlights()
		helper.register_keymaps()
	end,
}
