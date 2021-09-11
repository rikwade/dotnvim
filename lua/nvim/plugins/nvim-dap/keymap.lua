local opts = {silent = true}
local l = Keybind.get_lua_cmd_string

Keybind.g({
    {'n', '<leader>dS', l'R"dap".close()', opts},
    {'n', '<leader>dc', l'R"dap".continue()', opts},
    {'n', '<leader>dl', l'R"dap".run_last()', opts},
    {'n', '<leader>du', l'R"dap".step_out()', opts},
    {'n', '<leader>dd', l'R"dap".step_over()', opts},
    {'n', '<leader>di', l'R"dap".step_into()', opts},
    {'n', '<leader>dt', l'R"dap".toggle_breakpoint()', opts},

    {'n', '<leader>dk', l'R"dap".up()', opts},
    {'n', '<leader>dj', l'R"dap".down()', opts},
    {'n', '<leader>dr', l'R"dap".restart()', opts},

    {'n', '<leader>dh', l'R"dap.ui.variables".hover()', opts},
    {'v', '<leader>dh', l'R"dap.ui.variables".visual_hover()', opts},
    {
        'n',
        '<leader>ds',
        l'R"dap.ui.widgets".centered_float(R"dap.ui.widgets".scopes)',
        opts,
    },

    {'n', '<leader>do', l'R"dap".repl.open()', opts},
})
