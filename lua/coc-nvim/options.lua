local Option = require('vim.option')

local OptionType = Option.OptionType
local add_options = Option.add_options

local options = {
	hidden = true,
	backup = false,
	writebackup = false,
	updatetime = 300,
	shortmess = vim.o.shortmess .. 'c',
	signcolumn = 'number',
}

add_options(OptionType.GLOBAL_OPTION, options);
