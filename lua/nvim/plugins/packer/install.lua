return require('packer').startup(function()
    -- This is just to get rid of LSP errors on each line
    local use = use

    ----------------------------------------------------------------------
    --                               LSP                                --
    ----------------------------------------------------------------------
    use {
        'kabouzeid/nvim-lspinstall',
        run = function()
            require('nvim.plugins.lspinstall').install_servers()
        end,
    }

    use {
        'neovim/nvim-lspconfig',
        config = function() require('nvim.plugins.lsp') end,
    }

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
            'css',
        },
        config = function() require('nvim.plugins.coc-nvim') end,
    }

    -- AUTO COMPLETION FEATURES FOR LSP
    use {'hrsh7th/nvim-compe'}

    -- OTHER LANGUAGE SUPPORT
    -- markdown preview
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        ft = {'markdown'},
    }

    -- code formatters
    use {
        'mhartington/formatter.nvim',
        rocks = {'luaformatter', server = 'https://luarocks.org/dev'},
        config = function() require('nvim.plugins.formatter') end,
    }

    ----------------------------------------------------------------------
    --                            DEBUGGING                             --
    ----------------------------------------------------------------------
    use {
        'mfussenegger/nvim-dap',
        config = function() require('nvim.plugins.nvim-dap') end,
    }
    use {
        'puremourning/vimspector',
        ft = {'python'},
        -- run = ':VimspectorInstall debugpyVimspectorInstall debugpy'
    }

    ----------------------------------------------------------------------
    --                               FILE                               --
    ----------------------------------------------------------------------
    -- File explorer and its icons
    use {'kyazdani42/nvim-tree.lua'}
    use {'kyazdani42/nvim-web-devicons'}

    -- fuzzy search
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    }

    ----------------------------------------------------------------------
    --                               GIT                                --
    ----------------------------------------------------------------------
    -- git client
    use {'tpope/vim-fugitive'}

    -- git file changes
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('nvim.plugins.gitsigns') end,
    }

    ----------------------------------------------------------------------
    --                             EDITING                              --
    ----------------------------------------------------------------------
    use {
        's1n7ax/nvim-lazy-inner-block',
        config = function() require('nvim-lazy-inner-block').setup() end,
    }

    -- auto pair brackets
    use {'jiangmiao/auto-pairs'}

    -- handle pairs of text objects
    use {'tpope/vim-surround'}

    -- syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        branch = '0.5-compat',
        run = ':TSUpdate',
    }

    -- treesitter text objects
    use {'nvim-treesitter/nvim-treesitter-textobjects'}

    -- popup terminal
    use {
        's1n7ax/nvim-terminal',
        config = function() require('nvim.plugins.nvim-terminal') end,
    }

    ----------------------------------------------------------------------
    --                              EDITOR                              --
    ----------------------------------------------------------------------
    -- inline serch guide
    use {'unblevable/quick-scope'}

    -- smooth scrolling
    use {'psliwka/vim-smoothie'}

    -- motion
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function() require('nvim.plugins.hop') end,
    }

    -- status line
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
    }

    -- full screen mode
    use {
        'folke/zen-mode.nvim',
        config = function() require('nvim.plugins.zen-mode') end,
    }

    -- comment frame
    use {
        's1n7ax/nvim-comment-frame',
        requires = {'nvim-treesitter'},
        config = function() require('nvim-comment-frame').setup() end,
    }

    -- shows start line at block end
    use {
        'haringsrob/nvim_context_vt',
        config = function() require('nvim_context_vt').setup() end,
    }

    ----------------------------------------------------------------------
    --                           COLOR THEMES                           --
    ----------------------------------------------------------------------
    --[[
	use { 'ghifarit53/tokyonight-vim' }
	use { 'yong1le/darkplus.nvim' }
	use {
		'marko-cerovac/material.nvim',
		config = function ()
			Variable.g({
				material_style = 'darker',
				material_italic_comments = true,
				material_italic_keywords = true,
				material_italic_functions = true,
				material_italic_variables = false,
				material_contrast = true,
				material_borders = false,
				material_disable_background = false,
			})

			require('material').set()
		end
	}
    --]]
    use {
        'rafamadriz/neon',
        config = function() Command.cmd({'colorscheme neon'}) end,
    }

    ----------------------------------------------------------------------
    --                              OTHER                               --
    ----------------------------------------------------------------------
    -- startup time tracker
    use {'dstein64/vim-startuptime'}
end)
