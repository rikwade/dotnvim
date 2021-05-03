Variable.g({
	completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy', 'all' },
	completion_matching_ignore_case = true,
	completion_matching_smart_case = true,
	completion_trigger_character = { '.' },
	completion_trigger_keyword_length = 1,
	completion_trigger_on_delete = true,
	completion_trigger_keyword_length = 1,
	completion_trigger_on_delete = true,
	completion_timer_cycle = 30
})

a = vim.api

function aslkfjsldokfjl()
	print("testing")
	if(Coc.is_pum_visible()) then
		a.nvim_input("<C-n>")
	else
        a.nvim_input("<lt>C-j>")
	end
end

function on_attach(bufnr)
    Keybind.b({
		{ bufnr, 'i', '<c-space>', [[<plug>(completion_trigger)]] },
		{ bufnr, 'i', '<c-j>', "<CMD>lua aslkfjsldokfjl()<CR>", { noremap = true, silent=true } },
		{ bufnr, 'i', '<c-k>', [[pumvisible() ? "\<C-p>" : "\<c-k>"]], { noremap = true, expr = true } },
	})
end

return {
	on_attach = on_attach
}
