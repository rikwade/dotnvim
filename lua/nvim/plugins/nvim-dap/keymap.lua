local Shortcut = R 'nvim.newutil.keymap'
local l = Keybind.get_lua_cmd_string

Shortcut:mode('n'):options():noremap():next():keymaps(
    {
        -- close the debug sessio
        { ',tS', l 'R"dap".close()' },

        -- start the debug session and continue to next breakpoint
        { ',tc', l 'R"dap".continue()' },

        -- run last again
        { ',tl', l 'R"dap".run_last()' },

        { ',tu', l 'R"dap".step_out()' },
        { ',td', l 'R"dap".step_over()' },
        { ',ti', l 'R"dap".step_into()' },

        -- create and remove a breakpoint
        { ',tt', l 'R"dap".toggle_breakpoint()' },

        -- go up in the call stack
        { ',tk', l 'R"dap".up()' },

        -- go down in the call stack
        { ',tj', l 'R"dap".down()' },

        -- restart the execution
        { ',tr', l 'R"dap".restart()' },

        -- inspect node on cursor
        { ',th', l 'R"dap.ui.variables".hover()' },

        -- inspect all scope properties
        { ',ts', l 'R"dap.ui.widgets".centered_float(R"dap.ui.widgets".scopes)' },

        -- open repl window
        { ',to', l 'R"dap".repl.open()' },
    }):mode('v'):keymaps(
    {
        -- evaluate selected portion
        { ',th', l 'R"dap.ui.variables".visual_hover()' },
    })
