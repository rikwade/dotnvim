return {
	'williamboman/mason-lspconfig.nvim',
	-- rocks = { 'promise-lua' },
	event = 'BufReadPre',
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
		require('nvim.plugin.lsp.common.ui').setup()
		require('nvim.plugin.lsp.common.keymaps').setup()
		require('nvim.plugin.lsp.common.server-start-notification').setup()
		require('nvim.plugin.lsp.common.disable-semantic-tokens').setup()

		-- lsp lang specific config
		require('nvim.plugin.lsp.lua.workspace-config').setup()
		require('nvim.plugin.lsp.lua.vim-global-diagnostic').setup()
		require('nvim.plugin.lsp.emmet').setup()
		require('nvim.plugin.lsp.java').setup()
		require('nvim.plugin.lsp.rust.rust_tools').setup()
		require('nvim.plugin.lsp.tsserver').setup()

		-- dap config
		-- require('nvim.plugins.nvim-dap.ui').setup()
		-- require('nvim.plugins.nvim-dap.keymap').setup()
		-- require('nvim.plugins.nvim-dap.java').setup()
		-- require('nvim.plugins.nvim-dap.java.command').setup()

		-- setup LSes

		require('mason').setup()
		require('mason-lspconfig').setup({
			automatic_installation = true,
			ui = {
				icons = {
					server_installed = '✓',
					server_pending = '➜',
					server_uninstalled = '✗',
				},
			},
		})

		local Lsp = require('nvim.utils.lsp')

		local servers = {
			'bashls',
			'cssls',
			'dockerls',
			'eslint',
			'graphql',
			'html',
			'jsonls',
			'jdtls',
			'sumneko_lua',
			'pyright',
			'rust_analyzer',
			'tsserver',
			'volar',
			'groovyls',
			'clangd',
			'emmet_ls',
		}

		Lsp.setup(servers)
	end,
}
