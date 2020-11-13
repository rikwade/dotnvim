local Keybind = require('vim.keybind')

local KeybindType = Keybind.KeybindType
local add_keybinds = Keybind.add_keybinds

local buffer = {
    -- [ j + k ] to go to normal mode from insert
    { '', '<F6>', ':setlocal spell! spelllang=en_us<CR>' },
}

local i_buffer = {
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
}

local n_buffer = {
    -- reload nvim configuration file
    { 'n', ',r', ':so $MYVIMRC<cr>' },

    -- edit nvim configuration file
    { 'n', ',e', ':vsp $MYVIMRC<cr>' },

    -- [ ctrl + s ] save the current buffer
    { 'n', '<c-s>', ':w<cr>' },

    -- [ ctrl + q ] quite the current buffer
    { 'n', '<c-q>', ':q<cr>' },
}

local t_buffer = {
    -- [ j + k ] to go to normal mode from terminal
    { 't', 'jk', [[ <C-\><C-n> ]] },
}

add_keybinds(KeybindType.BUFFER_MAPPING, buffer)
add_keybinds(KeybindType.BUFFER_MAPPING, i_buffer)
add_keybinds(KeybindType.BUFFER_MAPPING, n_buffer)
add_keybinds(KeybindType.BUFFER_MAPPING, t_buffer)
