local packman = require('packman_lua.packman')

packman.get('kyazdani42/nvim-tree.lua')
packman.get('kyazdani42/nvim-web-devicons')
packman.get('mhartington/oceanic-next')
packman.get('neovim/nvim-lspconfig')
packman.get('nvim-lua/completion-nvim')
packman.get('junegunn/fzf')
packman.get('junegunn/fzf.vim')

-- interactive git for vim
packman.get('tpope/vim-fugitive')

-- diagnostic-nvim is no longer needed
-- diagnostic features come with nvim core vim.lsp.diagnostic
-- packman.get('nvim-lua/diagnostic-nvim')
