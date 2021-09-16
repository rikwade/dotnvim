local l = Keybind.get_lua_cmd_string

Keybind.g(
    {
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
        { 'i', '<c-j>', l 'Pum.goto_next({ keybind = "<lt>down>" })' },

        -- [ ctrl + k ] hit up arrow key
        { 'i', '<c-k>', l 'Pum.goto_prev({ keybind = "<lt>up>" })' },

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
        -- [ j + j ] to go to normal mode from insert
        { 'i', 'jj', '<esc>' },

        -- [ ctrl + d ] deletes a character in front of the cursor
        { 'i', '<c-d>', '<delete>' },
    })
