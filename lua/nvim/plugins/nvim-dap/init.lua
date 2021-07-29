local opts = {silent = true}

Keybind.g({
    {'n', '<F5>', ':lua require("dap").continue()<CR>', opts},
    {'n', '<F9>', ':lua require("dap").step_out()<CR>', opts},
    {'n', '<F10>', ':lua require("dap").step_over()<CR>', opts},
    {'n', '<F11>', ':lua require("dap").step_into()<CR>', opts},
    {'n', '<F12>', ':lua require("dap").toggle_breakpoint()<CR>', opts},

    {'n', '<leader>do', ':lua require("dap").repl.open()<CR>', opts},
    {'n', '<leader>dl', ':lua require("dap").run_last()<CR>', opts},
})
