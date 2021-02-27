-- local packman = require('nvim.plugins.packman_lua.packman' }


return require('packer').startup(function()
	
	-- FILE EXPLORER
	use { 'preservim/nerdtree' }
	use { 'ryanoasis/vim-devicons' }

	-- packman.get('kyazdani42/nvim-tree.lua' }
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



	-- LANGUAGE SERVER CONFIGURATIONS
	-- @TODO
	-- 2020.11.24
	-- there are some features missing with built-in lsp like go to definition
	-- features should be further analyzed and should be configured
	-- removing the plugin for now until I get time to configure for coc-nvim
	use { 'neovim/nvim-lspconfig' }
	use { 'neoclide/coc.nvim' }

	-- debugging
	use { 'puremourning/vimspector' }
	-- @IMPORTANT
	-- install following after
	-- :VimspectorInstall debugpyVimspectorInstall debugpy



	-- AUTO COMPLETION FEATURES FOR LSP
	use { 'nvim-lua/completion-nvim' }



	-- SEARCH
	-- @NOTE: removeing fzf in favor of telescope
	-- packman.get('junegunn/fzf' }
	-- packman.get('junegunn/fzf.vim' }
	use { 'nvim-lua/popup.nvim' }
	use { 'nvim-lua/plenary.nvim' }
	use { 'nvim-telescope/telescope.nvim' }



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
	-- @IMPORTANT: run :TSUpdate after the installation
	use { 'nvim-treesitter/nvim-treesitter' }

	-- top window bar
	use { 'romgrk/barbar.nvim' }

	-- popup terminal
	use { 's1n7ax/nvim-terminal' }

	-- inline serch guide
	use { 'unblevable/quick-scope' }

	-- smooth scrolling
	use { 'psliwka/vim-smoothie' }

	-- motion
	use { 'easymotion/vim-easymotion' }



	-- OTHER LANGUAGE SUPPORT
	-- markdown preview
	use { 'iamcco/markdown-preview.nvim' }

end)
