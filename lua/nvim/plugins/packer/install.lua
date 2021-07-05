return require('packer').startup(function()
	-- FILE EXPLORER
	-- use { 'preservim/nerdtree' }
	-- use { 'ryanoasis/vim-devicons' }

	use { 'kyazdani42/nvim-tree.lua' }
	use { 'kyazdani42/nvim-web-devicons' }

	-- COLOR THEME
	use { 'mhartington/oceanic-next' }
	use { 'eemed/sitruuna.vim' }
	use { 'arzg/vim-colors-xcode' }
	use { 'wadackel/vim-dogrun' }

	use { 'tjdevries/colorbuddy.vim' }
	use { 'tjdevries/gruvbuddy.nvim' }

	use { 'npxbr/gruvbox.nvim' }
	use { 'Th3Whit3Wolf/onebuddy' }
	use { 'embark-theme/vim' }
	use { 'bluz71/vim-nightfly-guicolors' }
	use { 'ghifarit53/tokyonight-vim' }



	-- LANGUAGE SERVER CONFIGURATIONS
	use {
		'kabouzeid/nvim-lspinstall',
		run = function()
			require('nvim.plugins.lspinstall').install_servers()
		end
	}
	use { 'neovim/nvim-lspconfig' }

	use { 
		'neoclide/coc.nvim',
		branch = 'release',
		ft = {
			'java',
			'json',
			'html',
			'markdown',
			'javascript',
			'javascriptreact',
			'php',
			'css'
		},
		config = function()
			require('nvim.plugins.coc-nvim')
		end
	}

	-- debugging
	use { 'puremourning/vimspector',
		ft = {'python'},
		-- run = ':VimspectorInstall debugpyVimspectorInstall debugpy'
	}



	-- AUTO COMPLETION FEATURES FOR LSP
	use { 'nvim-lua/completion-nvim' }



	-- OTHER LANGUAGE SUPPORT
	-- markdown preview
	use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', ft = {'markdown'} }



	-- SEARCH
	-- @NOTE: removeing fzf in favor of telescope
	-- packman.get('junegunn/fzf' }
	-- packman.get('junegunn/fzf.vim' }
	use { 'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'}
		}
	}



	-- GIT
	use { 'tpope/vim-fugitive' }



	-- EDITOR
	-- auto pair brackets
	use { 'jiangmiao/auto-pairs' }

	-- box comments
	use { 'cometsong/CommentFrame.vim' }

	-- handle pair of text objects
	use { 'tpope/vim-surround' }

	-- syntax highlighting
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- top window bar
	-- Not sure if this is useful or just taking space
	-- Hard to find the correct tab sometimes
	-- use { 'romgrk/barbar.nvim' }

	-- popup terminal
	use { 's1n7ax/nvim-terminal' }

	-- inline serch guide
	use { 'unblevable/quick-scope' }

	-- smooth scrolling
	use { 'psliwka/vim-smoothie' }

	-- motion
	use { 'easymotion/vim-easymotion' }

	-- status line
	use {
	  'hoob3rt/lualine.nvim',
	  requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
end)
