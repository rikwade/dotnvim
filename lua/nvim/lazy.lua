local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup('nvim.plugin', {
	defaults = { lazy = true },
	--  install = { colorscheme = { 'tokyonight', 'habamax' } },
	checker = { enabled = true, notify = false },
	diff = {
		cmd = 'terminal_git',
	},
	performance = {
		cache = {
			enabled = true,
			-- disable_events = {},
		},
	},
	ui = {
		--  custom_keys = {

		--  ['<localleader>d'] = function(plugin)
		--  dd(plugin)
		--  end,
		--  },
	},
	debug = false,
})
