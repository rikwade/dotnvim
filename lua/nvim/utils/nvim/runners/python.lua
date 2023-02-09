local helper = require('nvim.utils.nvim.runners.helper')

local id

local M = {}

function M.setup()
	id = vim.api.nvim_create_autocmd('BufWritePost', {
		pattern = '*.py',
		callback = function()
			helper.run_file('python')
		end,
		group = vim.api.nvim_create_augroup('PythonDev', { clear = true })
	})
end

function M.cleanup()
	if id then
		vim.api.nvim_del_autocmd(id)
	end

	id = nil
end

return M
