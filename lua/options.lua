local Option = require('vim.option')

local OptionType = Option.OptionType;
local add_options = Option.add_options;

local global_options = {
    shiftwidth = 4,
    tabstop = 4,

	-- code folding
    foldmethod = 'syntax',
	foldlevelstart = 1,

	-- enable mouse in vim
	mouse = 'n',

	smartcase = true,
	ignorecase = true,
	wrap = true,
	background = 'dark',
	termguicolors = true,
	inccommand = 'split',
	splitright = true,
	splitbelow = true,

	-- hide unsaved file when closing the buffer
	-- usually vim doesn't allow closing unsaved buffer unless you force it
	-- but with hidden option, buffer will be hidden when you close it
	-- vim will prompt you to save when closing vim editor
	hidden = true,
}

local window_options = {
    number = true,
    relativenumber = true,
}

local buffer_options = {
}

-- adding options
add_options(OptionType.GLOBAL_OPTION, global_options)
add_options(OptionType.WINDOW_OPTION, window_options)
add_options(OptionType.BUFFER_OPTION, buffer_options)
