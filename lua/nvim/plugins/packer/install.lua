R'packer'.init(
    {
        max_jobs = 2,
    })

return R'packer'.startup(
           function()
        -- This is just to get rid of LSP errors on each line
        ---@diagnostic disable-next-line: undefined-global
        local use = use

        ----------------------------------------------------------------------
        --                               LSP                                --
        ----------------------------------------------------------------------

        -- lsp
        use {
            'kabouzeid/nvim-lspinstall',
            run = function()
                R'nvim.plugins.lspinstall'.install_servers()
            end,
            requires = {
                {
                    'neovim/nvim-lspconfig',
                    config = function()
                        R 'nvim.plugins.lsp'
                    end,
                },
            },
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
        }

        -- code formatters
        use {
            'mhartington/formatter.nvim',
            rocks = {
                'luaformatter',
                server = 'https://luarocks.org/dev',
            },
            run = { 'yarn global add prettier prettier-plugin-java' },
            keys = '<leader>f',
            config = function()
                R 'nvim.plugins.formatter'
            end,
        }

        ----------------------------------------------------------------------
        --                            DEBUGGING                             --
        ----------------------------------------------------------------------
        use {
            'mfussenegger/nvim-dap',
            config = function()
                R 'nvim.plugins.nvim-dap'
            end,
            requires = {
                'rcarriga/nvim-dap-ui',
                'theHamsta/nvim-dap-virtual-text',
            },
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
        }

        -- fuzzy search
        use {
            'nvim-telescope/telescope.nvim',
            config = function()
                require('nvim.plugins.telescope')
            end,
            requires = {
                'nrim-lua/plenary.nvim',
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
                R'nvim-search-and-replace'.setup()
            end,
        }

        use {
            'winston0410/commented.nvim',
            requires = 'JoosepAlviste/nvim-ts-context-commentstring',
            config = function()
                R 'nvim.plugins.nvim-commented'
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

        -- status line
        use {
            'hoob3rt/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons' },
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
            keys = '<leader>cf',
            requires = { 'nvim-treesitter' },
            config = function()
                R'nvim-comment-frame'.setup()
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
