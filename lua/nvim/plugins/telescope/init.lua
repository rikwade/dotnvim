local actions = require('telescope.actions')


Keybind.g({
	{ 'n', '<c-p>', '<cmd>lua require("telescope.builtin").find_files()<cr>' },
	{ 'n', '<leader>tf', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>' },
	{ 'n', '<leader>tg', '<cmd>lua require("telescope.builtin").live_grep()<cr>' },
	{ 'n', '<leader>*', '<cmd>lua require("telescope.builtin").grep_string()<cr>' },
	{ 'n', '<c-t>', '<cmd>lua require("telescope.builtin").buffers()<cr>' },
	{ 'n', '<leader>th', '<cmd>lua require("telescope.builtin").help_tags()<cr>' },

	{ 'i', '<c-r>', '<cmd>lua require("telescope.builtin").registers()<cr>' },
})

require('telescope').setup()
