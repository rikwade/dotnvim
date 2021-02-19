Coc = require('nvim.plugins.coc-nvim.coc')

require('nvim.plugins.coc-nvim.extensions')
require('nvim.plugins.coc-nvim.options')
require('nvim.plugins.coc-nvim.keybinds')

vim.api.nvim_exec([[
	augroup CocGroup
		autocmd!
		autocmd BufNew,BufEnter *.py execute "silent! CocDisable"
	augroup end
]], false)
