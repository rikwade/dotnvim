local Terminal = require('nvim-terminal')

terminal = Terminal
terminal:init(15, 15)

Keybind.g({
	{ 'n', '<leader>t', '<cmd>lua terminal:toggle_open_term()<cr>', {} },
	{ 't', '<leader>t', '<cmd>lua terminal:toggle_open_term()<cr>', {} }
})
