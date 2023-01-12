local dapui = require('dapui')
local Command = require('nvim.utils.nvim.command')

Command():add_all({
	{ name = 'Dap', action = dapui.toggle },
})
