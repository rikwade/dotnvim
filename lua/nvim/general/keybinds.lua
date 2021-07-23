----------------------------------------------------------------------
--                           NORMAL MODE                            --
----------------------------------------------------------------------
Keybind.g({
	----------------------------------------------------------------------
	--                              CONFIG                              --
	----------------------------------------------------------------------
    -- reload nvim configuration file
    { 'n', ',r', [[:lua require('nvim.utils.common.module').reload_package('nvim')<CR>]] },


	----------------------------------------------------------------------
	--                           CURSOR MOVE                            --
	----------------------------------------------------------------------
    -- [ ctrl + h ] move cursor to left window
    { 'n', '<c-h>', '<c-w>h' },

    -- [ ctrl + l ] move cursor to right window
    { 'n', '<c-l>', '<c-w>l' },

    -- [ ctrl + j ] move cursor to bottom window
    { 'n', '<c-j>', '<c-w>j' },

    -- [ ctrl + k ] move cursor to top window
    { 'n', '<c-k>', '<c-w>k' },

	-- [ '' ] move to last cursor position in the jump list
	{ 'n', [['']], '``' },

	-- [ 0 ] to go to the start of the line
	{ 'n', '0', '^' },


	----------------------------------------------------------------------
	--                        BUFFER READ WRITE                         --
	----------------------------------------------------------------------
    -- [ ctrl + s ] save the current buffer
    { 'n', '<c-s>', ':w<cr>' },

    -- [ ctrl + q ] quite the current buffer
    { 'n', '<c-q>', ':q<cr>' },


	----------------------------------------------------------------------
	--                          CUT COPY PASTE                          --
	----------------------------------------------------------------------
    -- [ Y ] copy until the end of the line
    { 'n', 'Y', 'y$' },

    -- [ ctrl + y ] copy current line and paste next line
    { 'n', '<c-y>', 'yyp' },

	-- [ d + <bracket> ] remove inside <bracket>
	{ 'n', [[d']], [[di']] },
	{ 'n', [[d"]], [[di"]] },
	{ 'n', [[d{]], [[di{]] },
	{ 'n', [[d[]], [[di[]] },
	{ 'n', [[d(]], [[di(]] },
	{ 'n', [[d<]], [[di<]] },
	{ 'n', [[d`]], [[di`]] },
})


----------------------------------------------------------------------
--                           INSERT MODE                            --
----------------------------------------------------------------------
Keybind.g({
	----------------------------------------------------------------------
	--                           CURSOR MOVE                            --
	----------------------------------------------------------------------
    -- [ ctrl + ; ] put a semicolon EOL and go to next line
    { 'i', '<c-;>', '<esc>A;' },

	-- [ ctrl + o ] add new line in insert mode
    { 'i', '<c-o>', '<esc>o' },

    -- [ ctrl + e ] go to end of the line
    { 'i', '<c-e>', '<esc>A' },

    -- [ ctrl + a ] go to beginning of the line
    { 'i', '<c-a>', '<esc>I' },

    -- [ ctrl + b ] hit left arrow key
    { 'i', '<c-b>', '<left>' },

    -- [ ctrl + l ] hit right arrow key
    { 'i', '<c-l>', '<right>' },

    -- [ ctrl + j ] hit down arrow key
    { 'i', '<c-j>', '<cmd>lua Pum.goto_next({ keybind = "<lt>down>" })<cr>' },

    -- [ ctrl + k ] hit up arrow key
    { 'i', '<c-k>', '<cmd>lua Pum.goto_prev({ keybind = "<lt>up>" })<cr>' },


	----------------------------------------------------------------------
	--                          CUT COPY PASTE                          --
	----------------------------------------------------------------------
    -- [ ctrl + y ] copy current line and paste next line
    { 'i', '<c-y>', '<esc>yyp' },

    -- [ ctrl + s ] save the current buffer
    { 'i', '<c-s>', '<esc>:w<cr>a' },


	----------------------------------------------------------------------
	--                              OTHER                               --
	----------------------------------------------------------------------
    -- [ j + k ] to go to normal mode from insert
    { 'i', 'jj', '<esc>' },

	-- [ ctrl + d ] deletes a character in front of the cursor
    { 'i', '<c-d>', '<delete>' },
})


----------------------------------------------------------------------
--                             TERMINAL                             --
----------------------------------------------------------------------
Keybind.g({
    -- [ ctrl + k ] move cursor to top window from terminal
	{ 't', 'jj', [[<c-\><c-n>]], {} },

	-- [ ctrl + k ] to change the window from terminal
	{ 't', '<c-k>', [[<c-\><c-n><c-w>k]], {} },

    -- [ ctrl + j ] move cursor to bottom window from terminal
	{ 't', '<c-j>', [[<c-\><c-n><c-w>j]], {} },

    -- [ ctrl + h ] move cursor to left window from terminal
	{ 't', '<c-j>', [[<c-\><c-n><c-w>h]], {} },

    -- [ ctrl + l ] move cursor to right window from terminal
	{ 't', '<c-j>', [[<c-\><c-n><c-w>l]], {} },
})


----------------------------------------------------------------------
--                              OTHER                               --
----------------------------------------------------------------------
Keybind.g({
    -- [ <F6> ] to go enable spell checker
    { '', '<F6>', ':setlocal spell! spelllang=en_us<cr>' },
})
