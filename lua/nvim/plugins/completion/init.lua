Keybind.g({
	-- { 'i', '<c-space>', [[<plug>(completion_trigger)]] },
	{ 'i', '<c-j>', [[pumvisible() ? "\<C-n>" : "\<c-j>"]], { noremap = true, expr = true } },
	{ 'i', '<c-k>', [[pumvisible() ? "\<C-p>" : "\<c-k>"]], { noremap = true, expr = true } },
})

