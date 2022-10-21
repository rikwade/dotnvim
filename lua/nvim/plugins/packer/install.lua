---@diagnostic disable: undefined-global
require('packer').init({
    max_jobs = 20,
})

return require('packer').startup(function()
    use_rocks({ 'penlight', 'promise-lua' })

    ----------------------------------------------------------------------
    --                               LSP                                --
    ----------------------------------------------------------------------

    -- lsp
    use({
        'williamboman/mason-lspconfig.nvim',
        rocks = { 'promise-lua' },
        requires = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
            'onsails/lspkind-nvim',
            'MunifTanjim/nui.nvim',
            {
                'simrat39/rust-tools.nvim',
                requires = {
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
            require('nvim.plugins.lsp.common.cmp-capability').setup()

            -- lsp lang specific config
            require('nvim.plugins.lsp.lua.workspace-config').setup()
            require('nvim.plugins.lsp.emmet').setup()
            require('nvim.plugins.lsp.java').setup()
            require('nvim.plugins.lsp.rust.rust_tools').setup()
            require('nvim.plugins.lsp.tsserver').setup()

            -- dap config
            require('nvim.plugins.nvim-dap.ui').setup()
            require('nvim.plugins.nvim-dap.keymap').setup()
            require('nvim.plugins.nvim-dap.java').setup()
            require('nvim.plugins.nvim-dap.java.command').setup()

            -- setup LSes
            require('nvim.plugins.mason-lspconfig').setup()
            require('nvim.plugins.lsp').setup()
        end,
    })

    -- completion menu
    use({
        'hrsh7th/nvim-cmp',
        afetr = 'mason-lspconfig.nvim',
        config = function()
            require('nvim.plugins.nvim-cmp')
        end,
        requires = {
            -- CMP Sources
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-cmdline',
            'f3fora/cmp-spell',
            'saadparwaiz1/cmp_luasnip',
            -- 'hrsh7th/cmp-emoji',
            's1n7ax/nvim-ts-utils',
            's1n7ax/nvim-snips',

            -- Other plugins
            {
                'L3MON4D3/LuaSnip',
                config = function()
                    require('nvim.plugins.luasnip').setup()
                end,
            },
        },
    })

    -- null ls
    use({
        'jose-elias-alvarez/null-ls.nvim',
        after = 'mason-lspconfig.nvim',
        config = function()
            require('nvim.plugins.null-ls')
        end,
    })

    -- lua development tool
    use({ 'bfredl/nvim-luadev' })

    -- markdown preview
    use({
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        config = function()
            require('nvim.plugins.markdown-preview')
        end,
    })

    ----------------------------------------------------------------------
    --                            DEBUGGING                             --
    ----------------------------------------------------------------------
    use({
        'mfussenegger/nvim-dap',
        requires = {
            {
                'rcarriga/nvim-dap-ui',
                config = function()
                    require('nvim.plugins.nvim-dap-ui')
                end,
            },
            'theHamsta/nvim-dap-virtual-text',
        },
        config = function()
            require('dap').set_log_level('TRACE')
        end,
    })

    ----------------------------------------------------------------------
    --                               FILE                               --
    ----------------------------------------------------------------------
    -- File explorer and its icons
    use({
        'nvim-neo-tree/neo-tree.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        branch = 'v2.x',
        config = function()
            require('nvim.plugins.nvim-neo-tree')
        end,
    })

    -- fuzzy search
    use({
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'make',
            },
        },
        config = function()
            require('nvim.plugins.nvim-telescope')
        end,
    })

    ----------------------------------------------------------------------
    --                               GIT                                --
    ----------------------------------------------------------------------
    -- git file changes
    use({
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('nvim.plugins.gitsigns')
        end,
    })

    ----------------------------------------------------------------------
    --                             EDITING                              --
    ----------------------------------------------------------------------
    use({
        's1n7ax/nvim-lazy-inner-block',
        config = function()
            require('nvim-lazy-inner-block').setup()
        end,
    })

    -- auto pair brackets
    use({
        'windwp/nvim-autopairs',
        config = function()
            require('nvim.plugins.nvim-autopairs')
        end,
    })

    -- handle pairs of text objects
    use({
        'kylechui/nvim-surround',
        config = function()
            require('nvim-surround').setup({})
        end,
    })

    -- syntax highlighting
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim.plugins.treesitter')
            require('nvim.plugins.treesitter.query')
        end,
    })

    use({
        'nvim-treesitter/playground',
        requires = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('nvim.plugins.playground')
        end,
    })

    -- treesitter text objects
    use({
        'nvim-treesitter/nvim-treesitter-textobjects',
        require = {
            'nvim-treesitter/nvim-treesitter',
        },
    })

    -- popup terminal
    use({
        's1n7ax/nvim-terminal',
        config = function()
            require('nvim.plugins.nvim-terminal')
        end,
    })
    use({
        's1n7ax/nvim-search-and-replace',
        config = function()
            require('nvim.plugins.nvim-search-and-replace')
        end,
    })

    use({
        'winston0410/commented.nvim',
        requires = 'JoosepAlviste/nvim-ts-context-commentstring',
        config = function()
            require('nvim.plugins.nvim-commented')
        end,
    })

    use({
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end,
    })

    -- spreads out the parameters
    use({
        'aarondiel/spread.nvim',
        after = 'nvim-treesitter',
        config = function()
            require('nvim.plugins.spread')
        end,
    })

    use({
        'monaqa/dial.nvim',
        config = function()
            require('nvim.plugins.dial')
        end,
    })

    use({
        'abecodes/tabout.nvim',
        config = function()
            require('nvim.plugins.tabout')
        end,
    })
    ----------------------------------------------------------------------
    --                           END EDITING                            --
    ----------------------------------------------------------------------

    ----------------------------------------------------------------------
    --                              EDITOR                              --
    ----------------------------------------------------------------------
    -- inline search guide
    use({ 'unblevable/quick-scope' })

    -- smooth scrolling
    use({
        'tobdob/neoscroll.nvim',
        branch = 'time-scale',
        config = function()
            require('nvim.plugins.neoscroll')
        end,
    })

    -- motion
    use({
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            require('nvim.plugins.hop')
        end,
    })

    -- full screen mode
    use({
        'folke/zen-mode.nvim',
        keys = ',a',
        config = function()
            require('nvim.plugins.zen-mode')
        end,
    })

    -- comment frame
    use({
        's1n7ax/nvim-comment-frame',
        keys = ',C',
        requires = { 'nvim-treesitter' },
        config = function()
            require('nvim.plugins.nvim-comment-frame')
        end,
    })

    --  use({
    --  'beauwilliams/focus.nvim',
    --  config = function()
    --  require('nvim.plugins.nvim-focus')
    --  end,
    --  })

    use({
        'anuvyklack/windows.nvim',
        requires = {
            'anuvyklack/middleclass',
            'anuvyklack/animation.nvim',
        },
        config = function()
            vim.o.winwidth = 85
            vim.o.winminwidth = 5
            vim.o.equalalways = false
            require('windows').setup()
        end,
    })

    use({
        'sindrets/winshift.nvim',
        config = function()
            require('nvim.plugins.winshift')
        end,
    })

    use({
        'romgrk/nvim-treesitter-context',
        requires = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('nvim.plugins.treesitter-context')
        end,
    })

    -- status line
    use({
        'hoob3rt/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true,
        },
        config = function()
            require('nvim.plugins.lualine')
        end,
    })

    -- lib to pick window from currently opened windows
    use({
        's1n7ax/nvim-window-picker',
        tag = 'v1.*',
        config = function()
            ---@diagnostic disable-next-line: different-requires
            require('nvim.plugins.window-picker')
        end,
    })

    -- notification popup library
    use({
        'rcarriga/nvim-notify',
        config = function()
            require('nvim.plugins.notify')
        end,
    })

    -- sets the indentation automatically
    use({ 'zsugabubus/crazy8.nvim' })

    -- beautiful vim.ui alternatives
    use({
        'stevearc/dressing.nvim',
        requires = { 'nvim-telescope/telescope.nvim', 'MunifTanjim/nui.nvim' },
        config = function()
            require('dressing').setup({})
        end,
    })

    -- highlights the colors defined in the buffer with actual color
    use({
        'norcalli/nvim-colorizer.lua',
        opt = true,
        cmd = {
            'ColorizerAttachToBuffer',
            'ColorizerDetachFromBuffer',
            'ColorizerReloadAllBuffers',
            'ColorizerToggle',
        },
    })

    -- popup menu
    use({ 'meznaric/conmenu' })

    -- peak the line in the buffer when using jump line type
    use({
        'nacro90/numb.nvim',
        config = function()
            require('numb').setup()
        end,
    })

    -- shows a colorized horizontal line based on the scope
    use({
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('nvim.plugins.indent-blankline')
        end,
    })

    use({
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('nvim.plugins.diffview')
        end,
    })

    use({
        'folke/which-key.nvim',
        config = function()
            require('nvim.plugins.which-key-nvim')
        end,
    })

    use({
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async',
        config = function()
            require('nvim.plugins.ufo')
        end,
    })

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
    --]]

    --[[
    use({
        'rmehri01/onenord.nvim',
        config = function()
            require('onenord').setup()
        end,
    })
    --]]

    --[[
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.g.rose_pine_variant = 'base'
            vim.cmd('colorscheme rose-pine')
        end,
    })
    --]]

    use({
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            vim.g.catppuccin_flavour = 'mocha'
            require('catppuccin').setup()
            vim.cmd('colorscheme catppuccin')
        end,
    })

    --[[
    use({
        'mhartington/oceanic-next',
        config = function()
            vim.cmd('set t_Co=256')

            require('nvim.utils.nvim.variable').g({
                oceanic_next_terminal_bold = true,
                oceanic_next_terminal_italic = true,
            })

            vim.cmd('colorscheme OceanicNext')
        end,
    })
    --]]

    ----------------------------------------------------------------------
    --                              OTHER                               --
    ----------------------------------------------------------------------
    -- reduce the start up time
    use({ 'lewis6991/impatient.nvim' })

    -- startup time tracker
    use({ 'dstein64/vim-startuptime' })

    -- typing test
    use({
        'nagy135/typebreak.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('nvim.plugins.typebreak')
        end,
    })
end)
