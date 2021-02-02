require('nvim')

vim.api.nvim_exec([[
	augroup CocGroup
		autocmd!
		autocmd BufNew,BufEnter *.py execute "silent! CocDisable"
	augroup end
]], false)

-- vim.api.nvim_command('colorscheme gruvbuddy')
-- require('colorbuddy').colorscheme('onebuddy')
vim.api.nvim_command('colorscheme embark')
