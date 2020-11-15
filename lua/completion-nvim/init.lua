local Keybind = require('vim.keybind')

local KeybindType = Keybind.KeybindType
local add_keybinds = Keybind.add_keybinds

local global_binds = {
	{ 'i', '<c-space>', [[<c-p>]] },
	{ 'i', '<c-j>', [[pumvisible() ? "\<C-n>" : "\<c-j>"]], { noremap = true, expr = true } },
	{ 'i', '<c-k>', [[pumvisible() ? "\<C-p>" : "\<c-k>"]], { noremap = true, expr = true } },
}

add_keybinds(KeybindType.GLOBAL_MAPPING, global_binds)
