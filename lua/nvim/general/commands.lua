Command.cmd({
	-- setting the color scheme
	'colorscheme tokyonight'
})

vim.api.nvim_exec([[
let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1
]], false)
