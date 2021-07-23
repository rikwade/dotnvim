local actions = require('telescope.actions')


Keybind.g({
	{ 'n', '<c-p>', '<cmd>lua require("telescope.builtin").find_files()<cr>' },
	{ 'n', '<leader>tf', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>' },
	{ 'n', '<leader>tg', '<cmd>lua require("telescope.builtin").live_grep()<cr>' },
	{ 'n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>' },
	{ 'n', '<leader>th', '<cmd>lua require("telescope.builtin").help_tags()<cr>' }
})

require('telescope').setup()
