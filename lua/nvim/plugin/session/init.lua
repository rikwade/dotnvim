return {
	's1n7ax/session',
	name = 'session',
	keys = '<leader>oe',
	event = 'VeryLazy',
	dependencies = { 'settings' },
	dir = '/home/s1n7ax/Workspace/nvim/nvim-session',
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
