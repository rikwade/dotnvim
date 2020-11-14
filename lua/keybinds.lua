local Keybind = require('vim.keybind')

local KeybindType = Keybind.KeybindType
local add_keybinds = Keybind.add_keybinds

local n_global = {
    -- [ ctrl + h ] move cursor to left window
    { 'n', '<c-h>', '<c-w>h' },

    -- [ ctrl + l ] move cursor to right window
    { 'n', '<c-l>', '<c-w>l' },

    -- [ ctrl + j ] move cursor to bottom window
    { 'n', '<c-j>', '<c-w>j' },

    -- [ ctrl + k ] move cursor to top window
    { 'n', '<c-k>', '<c-w>k' },

    -- reload nvim configuration file
    { 'n', ',r', ':so $MYVIMRC<cr>' },

    -- edit nvim configuration file
    { 'n', ',e', ':vsp $MYVIMRC<cr>' },

    -- [ ctrl + s ] save the current buffer
    { 'n', '<c-s>', ':w<cr>' },

    -- [ ctrl + q ] quite the current buffer
    { 'n', '<c-q>', ':q<cr>' },
}

local i_global = {
    -- [ j + k ] to go to normal mode from insert
    { 'i', 'jk', '<esc>' },

    -- [ ctrl + ; ] put a cemicolon EOL and go to next line
    { 'i', '<c-;>', '<esc>A;<cr>' },

    -- [ ctrl + e ] add new line in insert mode
    { 'i', '<c-e>', '<esc>o' },

    -- [ ctrl + s ] save the current buffer
    { 'i', '<c-s>', '<esc>:w<cr>i' },

    -- [ ctrl + q ] quite the current buffer
    { 'i', '<c-q>', '<esc>:q<cr>' },

    -- [ <F6> ] to go enable spell checker
    { '', '<F6>', ':setlocal spell! spelllang=en_us<CR>' },
}

local t_buffer = {
    -- [ j + k ] to go to normal mode from terminal
    { 0, 't', 'jk', [[ <C-\><C-n> ]] },
}

add_keybinds(KeybindType.GLOBAL_MAPPING, n_global)
add_keybinds(KeybindType.GLOBAL_MAPPING, i_global)

add_keybinds(KeybindType.BUFFER_MAPPING, t_buffer)
