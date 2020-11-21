local Keybind = require('vim.keybind')
local Option = require('vim.option')

local add_options = Option.add_options
local OptionType = Option.OptionType

local add_keybinds = Keybind.add_keybinds
local KeybindType = Keybind.KeybindType

local global_binds = {
	{ 'i', '<c-space>', [[<c-p>]] },
	{ 'i', '<c-j>', [[pumvisible() ? "\<C-n>" : "\<c-j>"]], { noremap = true, expr = true } },
	{ 'i', '<c-k>', [[pumvisible() ? "\<C-p>" : "\<c-k>"]], { noremap = true, expr = true } },
}

local options = {
	completeopt = 'menuone,noinsert',
	shortmess = vim.o.shortmess .. 'c',
}

add_options(OptionType.GLOBAL_OPTION , options)
add_keybinds(KeybindType.GLOBAL_MAPPING, global_binds)
