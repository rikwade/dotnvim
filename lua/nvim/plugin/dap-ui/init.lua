return {
	'rcarriga/nvim-dap-ui',
	name = 'dap-ui',
	cmd = 'Dap',
	keys = { '<leader><leader>t' },
	config = function()
		require('nvim.plugin.dap-ui.ui')
		require('nvim.plugin.dap-ui.events')
		require('nvim.plugin.dap-ui.commands')
		require('nvim.plugin.dap-ui.setup')
		require('nvim.plugin.dap-ui.keymaps')
	end,
}
