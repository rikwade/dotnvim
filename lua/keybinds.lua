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

    -- [ Y ] copy until the end of the line
    { 'n', 'Y', 'y$' },

    -- [ ctrl + y ] copy current line and paste next line
    { 'n', '<c-y>', 'yyp' },
}

local i_global = {
	-- [ MOVING THE CURSOR ]
    -- [ ctrl + ; ] put a semicolon EOL and go to next line
    { 'i', '<c-;>', '<esc>A;' },

	-- [ ctrl + o ] add new line in insert mode
    { 'i', '<c-o>', '<esc>o' },

    -- [ ctrl + e ] go to end of the line
    { 'i', '<c-e>', '<esc>A' },

    -- [ ctrl + u ] go to beginning of the line
    { 'i', '<c-u', '<esc>I' },

    -- [ ctrl + j ] hit down arrow key
    { 'i', '<c-j>', '<down>' },

    -- [ ctrl + k ] hit up arrow key
    { 'i', '<c-k>', '<up>' },

    -- [ ctrl + b ] hit left arrow key
    { 'i', '<c-b>', '<left>' },

    -- [ ctrl + l ] hit right arrow key
    { 'i', '<c-l>', '<right>' },


    -- [ ctrl + y ] copy current line and paste next line
    { 'i', '<c-y>', '<esc>yyp' },



    -- [ j + k ] to go to normal mode from insert
    { 'i', 'jk', '<esc>' },

    -- [ ctrl + s ] save the current buffer
    { 'i', '<c-s>', '<esc>:w<cr>a' },

    -- [ <F6> ] to go enable spell checker
    { '', '<F6>', ':setlocal spell! spelllang=en_us<CR>' },
}

local t_global = {
    -- [ j + k ] to go to normal mode from terminal
    { 't', 'jk', [[ <C-\><C-n> ]] },
}

add_keybinds(KeybindType.GLOBAL_MAPPING, n_global)
add_keybinds(KeybindType.GLOBAL_MAPPING, i_global)
add_keybinds(KeybindType.GLOBAL_MAPPING, t_global)
