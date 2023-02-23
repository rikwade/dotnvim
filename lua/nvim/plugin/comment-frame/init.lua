return {
	's1n7ax/nvim-comment-frame',
	keys = '<leader>oc',
	dependencies = { 'treesitter' },
	config = function()
		local wk = require('which-key')

		require('nvim-comment-frame').setup({ disable_default_keymap = true })

		wk.register({
			['<leader>oc'] = { require('nvim-comment-frame').add_comment, 'Add comment frame' },
		})
	end,
}
