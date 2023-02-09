local java = require('nvim.utils.nvim.runners.java')

vim.api.nvim_create_user_command('Dev', function()
	java.setup()
end, {})

vim.api.nvim_create_user_command('DevClean', function()
	java.cleanup()
end, {})
