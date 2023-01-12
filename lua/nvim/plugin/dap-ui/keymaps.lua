local dapui = require('dapui')
local wk = require('which-key')

wk.register({
	['<leader><leader>t'] = { dapui.toggle, 'Toggle dap ui' },
})
