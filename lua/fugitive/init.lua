local Keybind = require('vim.keybind')

local KeybindType = Keybind.KeybindType
local add_keybinds = Keybind.add_keybinds

local keybinds = {
	{ 'n', '<leader>gs', '<cmd>Gstatus<cr>' },
}

add_keybinds(KeybindType.GLOBAL_MAPPING, keybinds)

