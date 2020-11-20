local packman = require('packman_lua.packman')

-- file explorer
packman.get('kyazdani42/nvim-tree.lua')

-- icons for nvim-tree file explorer
packman.get('kyazdani42/nvim-web-devicons')

-- color theme
packman.get('mhartington/oceanic-next')

-- language server configurations
packman.get('neovim/nvim-lspconfig')

-- auto completion features for lsp
packman.get('nvim-lua/completion-nvim')

-- fuzzy search features
packman.get('junegunn/fzf')
packman.get('junegunn/fzf.vim')

-- interactive git for vim
packman.get('tpope/vim-fugitive')

-- diagnostic-nvim is no longer needed
-- diagnostic features come with nvim core vim.lsp.diagnostic
-- packman.get('nvim-lua/diagnostic-nvim')
