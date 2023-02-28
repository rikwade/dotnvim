local dap = require('dap')
local wk = require('which-key')
local widgets = require('dap.ui.widgets')

local M = {}

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(arg)
		local buffer = arg.buf
		local server_name = vim.lsp.get_client_by_id(arg.data.client_id).name

		M.on_attach(server_name, buffer)
	end,
})

function M.on_attach(ls, buffer)
	M.setup_dap_keymaps(buffer)

	-- language specific overrides
	if ls.name == 'jdtls' then
		M.setup_java_keymaps(buffer)
	end
end

function M.setup_dap_keymaps(buffer)
	wk.register({
		name = 'Debug',
		e = {
			['t'] = { dap.toggle_breakpoint, 'Toggle breakpoint' },

			['r'] = { dap.restart, 'Restart' },
			['a'] = { dap.run_last, 'Run last' },

			['m'] = { dap.step_out, 'Step out' },
			['n'] = { dap.step_over, 'Step over' },
			['e'] = { dap.step_into, 'Step into' },
			['i'] = { dap.continue, 'Continue debug' },

			['l'] = { dap.up, 'Go up in call stack' },
			['u'] = { dap.down, 'Go down in call stack' },

			['I'] = { dap.terminate, 'Terminate' },

			['h'] = { widgets.hover, 'Hover' },
			['s'] = { M.inspect_scope, 'Inspect scope' },
			['o'] = { dap.repl.open, 'Open repl' },
		},
	}, { prefix = '<leader>', buffer = buffer })

	wk.register({
		name = 'Debug',
		e = {
			['i'] = { widgets.hover, 'Evaluate selected' },
		},
	}, { prefix = '<leader>', mode = 'v', buffer = buffer })
end

function M.setup_java_keymaps(buffer)
	wk.register({
		name = 'Debug',
		e = {
			['i'] = { JavaDapActions.continue, 'Continue java debug' },
		},
	}, { prefix = '<leader>', buffer = buffer })
end

function M.inspect_scope()
	widgets.centered_float(widgets.scopes).open()
end

return M
