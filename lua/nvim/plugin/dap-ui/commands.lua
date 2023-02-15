local dapui = require('dapui')

vim.api.nvim_create_user_command('Dap', dapui.toggle, {})

