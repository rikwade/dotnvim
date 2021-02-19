local opt = { noremap = true, expr = true, silent = true, nowait = true }
local silent_opt = { silent = true }

Keybind.g({
	-- code jumps
	{ 'n', 'gd', '<Plug>(coc-definition)', silent_opt },
	{ 'n', 'gi', '<Plug>(coc-implementation)', silent_opt },
	{ 'n', 'gr', '<Plug>(coc-references)', silent_opt },
	{ 'n', 'gt', '<Plug>(coc-type-definition)', silent_opt },
	{ 'n', 'K', '<cmd>lua Coc.show_documentation()<cr>', silent_opt },

	-- error jumps
	{ 'n', '<leader>j', '<Plug>(coc-diagnostic-next)', silent_opt },
	{ 'n', '<leader>k', '<Plug>(coc-diagnostic-prev)', silent_opt },

	-- actions
	{ 'n', '<leader>r', '<Plug>(coc-rename)', silent_opt},
	{ 'n', '<leader>a', '<Plug>(coc-codeaction)', silent_opt},
	{ 'n', '<leader>s', '<Plug>(coc-codeaction-selected)', silent_opt},
	{ 'n', '<leader>f', '<cmd>lua Coc.format_code()<cr>', silent_opt},
	{ 'n', '<leader>qf', '<Plug>(coc-fix-current)', silent_opt},

	-- text objects
	{ 'x', 'if', '<Plug>(coc-funcobj-i)', silent_opt },
	{ 'o', 'if', '<Plug>(coc-funcobj-i)', silent_opt },
	{ 'x', 'af', '<Plug>(coc-funcobj-a)', silent_opt },
	{ 'o', 'af', '<Plug>(coc-funcobj-a)', silent_opt },

	{ 'x', 'ic', '<Plug>(coc-classobj-i)', silent_opt },
	{ 'o', 'ic', '<Plug>(coc-classobj-i)', silent_opt },
	{ 'x', 'ac', '<Plug>(coc-classobj-a)', silent_opt },
	{ 'o', 'ac', '<Plug>(coc-classobj-a)', silent_opt },

	-- pop item selection
	{ 'i', '<c-j>', '<cmd>lua Coc.go_to_next_completion_item("<c-j>")', silent_opt },
	{ 'i', '<c-k>', '<cmd>lua Coc.go_to_previous_completion_item("<c-k>")', silent_opt },
	{ 'i', '<c-space>', [[coc#refresh()]], opt },
})
