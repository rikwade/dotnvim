G = {}
V = vim
API = vim.api
FN = vim.fn
LSP = vim.lsp
CMD = vim.cmd

Option = require('nvim.utils.option')
Variable = require('nvim.utils.variable')
Keybind = require('nvim.utils.keybind')
Command = require('nvim.utils.command')
Editor = require('nvim.utils.editor')
Pum = require('nvim.utils.pum')
Log = require('nvim.utils.common.log')

Vim = {
    Option = Option,
    Variable = Variable,
    Keybind = Keybind,
    Command = Command,
    Editor = Editor,
    Pum = Pum,
    Log = Log,
}
