local Option = require('vim.option')
local Variable = require('vim.variable')
local Keybind = require('vim.keybind')
local Command = require('vim.command')

local Vim = {
    Option = Option,
    Variable = Variable,
    Keybind = Keybind,
	Command = Command,
}

return Vim
