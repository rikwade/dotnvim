local python = require('nvim.utils.nvim.runners.python')

vim.api.nvim_create_user_command('Dev', function()
	python.setup()
end, {})

vim.api.nvim_create_user_command('DevClean', function()
	python.cleanup()
end, {})
