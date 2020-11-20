-- leader key has to be mapped before its mapped
vim.g.mapleader = " "

-- load package manager
require('packman_lua.packman')

-- plugin configurations
require('lua-tree')
require('fzf')
require('completion-nvim')
require('fugitive')

-- lsp
require('lsp')

-- basic configurations
require('options')
require('variables')
require('keybinds')
require('commands')
