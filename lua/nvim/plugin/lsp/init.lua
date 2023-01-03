return {
	'williamboman/mason-lspconfig.nvim',
	-- rocks = { 'promise-lua' },
	event = "BufReadPre",
	dependencies = {
		'mason',
		'cmp',
		'null-ls',
		'trouble',
		'neovim/nvim-lspconfig',
		'onsails/lspkind-nvim',
		'MunifTanjim/nui.nvim',
		'rcarriga/nvim-notify',
		'pyericz/promise-lua',
		{
			'simrat39/rust-tools.nvim',
			dependencies = {
				'neovim/nvim-lspconfig',
				'nvim-lua/plenary.nvim',
				'mfussenegger/nvim-dap',
			},
		},
	},
	config = function()
		-- lsp config
		require('nvim.plugins.lsp.common.ui').setup()
		require('nvim.plugins.lsp.common.keymaps').setup()
		require('nvim.plugins.lsp.common.server-start-notification').setup()

		-- lsp lang specific config
		require('nvim.plugins.lsp.lua.workspace-config').setup()
		require('nvim.plugins.lsp.lua.vim-global-diagnostic').setup()
		require('nvim.plugins.lsp.emmet').setup()
		require('nvim.plugins.lsp.java').setup()
		require('nvim.plugins.lsp.rust.rust_tools').setup()
		require('nvim.plugins.lsp.tsserver').setup()

		-- dap config
		-- require('nvim.plugins.nvim-dap.ui').setup()
		-- require('nvim.plugins.nvim-dap.keymap').setup()
		-- require('nvim.plugins.nvim-dap.java').setup()
		-- require('nvim.plugins.nvim-dap.java.command').setup()

		-- setup LSes
		require('nvim.plugins.mason-lspconfig').setup()
		require('nvim.plugins.lsp').setup()
	end,
}
