Keybind.g({
	{ 'n', '<leader>f', ':Format<CR>', { silent = true } }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
augroup END
]], true)
