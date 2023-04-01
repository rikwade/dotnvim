local path = '/home/s1n7ax/Workspace/nvim/nvim-session'

return {
	's1n7ax/nvim-session',
	name = 'session',
	keys = '<leader>oe',
	event = 'VeryLazy',
	dependencies = { 'settings' },
	dev = vim.fn.isdirectory(path),
	dir = path,
	config = function()
		local wk = require('which-key')

		wk.register({
			o = {
				name = 'Other',
				e = { require('session').restore_session, 'Restore session' },
			},
		}, {
			prefix = '<leader>',
		})

		-- create user command to save the session
		vim.api.nvim_create_user_command('SaveSession', function()
			require('session').save_session()
		end, { desc = 'Save the current session' })
	end,
}
