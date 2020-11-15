local Keybind = require('vim.keybind')

local KeybindType = Keybind.KeybindType
local add_keybinds = Keybind.add_keybinds

local binds = {
    { 'n', '<c-p>', [[<cmd>call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<cr>]], {} },
}

add_keybinds(KeybindType.GLOBAL_MAPPING, binds)
