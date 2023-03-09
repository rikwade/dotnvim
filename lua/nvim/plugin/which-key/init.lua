return {
	'folke/which-key.nvim',
	name = 'which-key',
	version = '1.1.0',
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 2000
		require('which-key').setup({
			triggers_blacklist = { i = { 'n' } },
		})
	end,
}
