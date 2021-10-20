---@diagnostic disable: undefined-global
R'packer'.init(
    {
        max_jobs = 2,
    })

return R'packer'.startup(
           function()

        use_rocks { 'lualogging', 'penlight', 'promise-lua' }

        ----------------------------------------------------------------------
        --                               LSP                                --
        ----------------------------------------------------------------------

        -- lsp
        use {
            'williamboman/nvim-lsp-installer',
            run = function()
                R 'nvim.plugins.nvim-lsp-installer'
            end,
            rocks = { 'promise-lua' },
            requires = { 'neovim/nvim-lspconfig' },
            config = function()
                -- setup stuff before LSes are initialized
                R'nvim.plugins.lsp.ui'.setup()
                R'nvim.plugins.lsp.keymaps'.setup()
                R'nvim.plugins.nvim-dap.java'.setup()

                -- setup LSes
                R'nvim.plugins.lsp'.setup()
            end,
        }

        -- completion menu
        use {
            'hrsh7th/nvim-cmp',
            config = function()
                R 'nvim.plugins.nvim-cmp'
            end,
            requires = {
                'dcampos/cmp-snippy',
                'dcampos/nvim-snippy',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-nvim-lua',
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-emoji',
                'hrsh7th/cmp-calc',
                'f3fora/cmp-spell',
                {
                    's1n7ax/vim-snippets',
                    config = function()
                        R 'nvim.plugins.nvim-snippy'
                    end,
                },
            },
        }

        -- markdown preview
        use {
            'iamcco/markdown-preview.nvim',
            run = 'cd app && yarn install',
            ft = { 'markdown' },
            config = function()
                R 'nvim.plugins.markdown-preview'
            end,
        }

        -- code formatters
        use {
            'mhartington/formatter.nvim',
            rocks = {
                'luaformatter',
                server = 'https://luarocks.org/dev',
            },
            run = { 'yarn global add prettier prettier-plugin-java' },
            keys = ',f',
            config = function()
                R 'nvim.plugins.formatter'
            end,
        }

        ----------------------------------------------------------------------
        --                            DEBUGGING                             --
        ----------------------------------------------------------------------
        use {
            'mfussenegger/nvim-dap',
            requires = {
                'rcarriga/nvim-dap-ui',
                'theHamsta/nvim-dap-virtual-text',
            },
            config = function()
                R 'nvim.plugins.nvim-dap'
            end,
        }

        use {
            'rcarriga/nvim-dap-ui',
            config = function()
                R 'nvim.plugins.nvim-dap-ui'
            end,
        }

        use {
            'theHamsta/nvim-dap-virtual-text',
            config = function()
                Variable.g(
                    {
                        dap_virtual_text = true,
                    })
            end,
        }

        ----------------------------------------------------------------------
        --                               FILE                               --
        ----------------------------------------------------------------------
        -- File explorer and its icons
        use {
            'kyazdani42/nvim-tree.lua',
            requires = { 'kyazdani42/nvim-web-devicons' },
            config = function()
                R 'nvim.plugins.nvim-tree'
            end,
        }

        -- fuzzy search
        use {
            'nvim-telescope/telescope.nvim',
            config = function()
                require('nvim.plugins.telescope')
            end,
            requires = {
                'nvim-lua/plenary.nvim',
                {
                    'nvim-telescope/telescope-fzf-native.nvim',
                    run = 'make',
                },
            },
        }

        ----------------------------------------------------------------------
        --                               GIT                                --
        ----------------------------------------------------------------------
        -- git file changes
        use {
            'lewis6991/gitsigns.nvim',
            requires = { 'nvim-lua/plenary.nvim' },
            config = function()
                R 'nvim.plugins.gitsigns'
            end,
        }

        ----------------------------------------------------------------------
        --                             EDITING                              --
        ----------------------------------------------------------------------
        use {
            's1n7ax/nvim-lazy-inner-block',
            config = function()
                R'nvim-lazy-inner-block'.setup()
            end,
        }

        -- auto pair brackets
        use { 'jiangmiao/auto-pairs' }

        -- handle pairs of text objects
        use { 'tpope/vim-surround' }

        -- syntax highlighting
        use {
            'nvim-treesitter/nvim-treesitter',
            branch = '0.5-compat',
            run = ':TSUpdate',
            config = function()
                R 'nvim.plugins.treesitter'
            end,
        }

        use {
            'nvim-treesitter/playground',
            requires = { 'nvim-treesitter/nvim-treesitter' },
            cmd = 'TSPlaygroundToggle',
            config = function()
                R 'nvim.plugins.playground'
            end,
        }

        use {
            'David-Kunz/treesitter-unit',
            config = function()
                R 'nvim.plugins.treesitter-unit'
            end,
        }

        -- treesitter text objects
        use { 'nvim-treesitter/nvim-treesitter-textobjects' }

        -- popup terminal
        use {
            's1n7ax/nvim-terminal',
            config = function()
                R 'nvim.plugins.nvim-terminal'
            end,
        }
        use {
            's1n7ax/nvim-search-and-replace',
            config = function()
                R 'nvim.plugins.nvim-search-and-replace'
            end,
        }

        use {
            'winston0410/commented.nvim',
            keys = ',c',
            requires = 'JoosepAlviste/nvim-ts-context-commentstring',
            config = function()
                R 'nvim.plugins.nvim-commented'
            end,
        }

        use {
            'windwp/nvim-ts-autotag',
            config = function()
                R'nvim-ts-autotag'.setup()
            end,
        }

        ----------------------------------------------------------------------
        --                              EDITOR                              --
        ----------------------------------------------------------------------
        -- inline serch guide
        use { 'unblevable/quick-scope' }

        -- smooth scrolling
        use { 'psliwka/vim-smoothie' }

        -- motion
        use {
            'phaazon/hop.nvim',
            as = 'hop',
            config = function()
                R 'nvim.plugins.hop'
            end,
        }

        -- full screen mode
        use {
            'folke/zen-mode.nvim',
            keys = '<leader><leader>',
            config = function()
                R 'nvim.plugins.zen-mode'
            end,
        }

        -- comment frame
        use {
            's1n7ax/nvim-comment-frame',
            keys = ',C',
            requires = { 'nvim-treesitter' },
            config = function()
                R 'nvim.plugins.nvim-comment-frame'
            end,
        }

        use {
            'beauwilliams/focus.nvim',
            config = function()
                require('focus').setup()
            end,
        }

        use {
            'sindrets/winshift.nvim',
            config = function()
                R 'nvim.plugins.winshift'
            end,
        }

        use { 'Darazaki/indent-o-matic' }

        use {
            'romgrk/nvim-treesitter-context',
            requires = { 'nvim-treesitter/nvim-treesitter' },
            config = function()
                R 'nvim.plugins.treesitter-context'
            end,
        }

        -- status line
        use {
            'hoob3rt/lualine.nvim',
            requires = {
                'kyazdani42/nvim-web-devicons',
                opt = true,
            },
            config = function()
                R 'nvim.plugins.lualine'
            end,
        }

        use {
            's1n7ax/nvim-window-picker',
            config = function()
                require'window-picker'.setup()
            end,
        }

        use { 'rcarriga/nvim-notify' }

        ----------------------------------------------------------------------
        --                           COLOR THEMES                           --
        ----------------------------------------------------------------------
        --[[
        use { 'ghifarit53/tokyonight-vim' }
        use { 'yong1le/darkplus.nvim' }
        use { 'rafamadriz/neon' }
        use { 'rose-pine/neovim', as = 'rose-pine' }
        use { 'glepnir/zephyr-nvim' }
        use { 'navarasu/onedark.nvim' }
        --]]

        use {
            'marko-cerovac/material.nvim',
            config = function()
                Variable.g(
                    {
                        material_style = 'palenight',
                    })
                CMD('colorscheme material')
            end,
        }

        ----------------------------------------------------------------------
        --                              OTHER                               --
        ----------------------------------------------------------------------
        -- startup time tracker
        use { 'dstein64/vim-startuptime' }
    end)
