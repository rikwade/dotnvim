local dapui = require('dapui')
local wk = require('which-key')

local M = {}

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(arg)
		local buffer = arg.buf
		local server_name = vim.lsp.get_client_by_id(arg.data.client_id).name

		M.on_attach(server_name, buffer)
	end,
})

function M.on_attach(_, buffer)
	wk.register({
		name = 'Debug',
		e = {
			q = { dapui.toggle, 'Toggle dap ui' },
		}
	}, { prefix = '<leader>', buffer = buffer })
end
