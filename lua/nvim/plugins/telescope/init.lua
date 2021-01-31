Keybind.g({
	{ 'n', '<c-p>', '<cmd>lua require("telescope.builtin").find_files()<cr>' },
	{ 'n', '<leader>g', '<cmd>lua require("telescope.builtin").live_grep()<cr>' },
	{ 'n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>' },
	{ 'n', '<leader>h', '<cmd>lua require("telescope.builtin").help_tags()<cr>' }
})
