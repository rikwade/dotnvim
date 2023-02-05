local wk = require('which-key')
local cursor_jump = require('nvim.utils.nvim.cursor-jump')

-- Initially following maps are remapped
-- L -> E -> K -> N -> J -> M -> H -> I -> L
wk.register({
	m = { 'h', 'Left' },
	M = { 'H', 'Top line of window' },

	h = { 'i', 'Insert' },
	H = { 'I', 'Insert at line start' },

	n = { cursor_jump.jump_forward, 'Down' },
	N = { 'J', 'Join below line' },

	k = { 'n', 'Find next' },
	K = { 'N', 'Find previous' },

	e = { cursor_jump.jump_backward, 'Up' },
	E = { 'K', 'Keyword lookup' },

	l = { 'e', 'Next end of word' },
	L = { 'E', 'Last char before white space' },

	i = { 'l', 'Right' },
	I = { 'L', 'Last line of window' },

	j = { 'm', 'Create mark' },
	J = { 'M', 'Middle line of window' },
}, {
	mode = { 'n', 'x', 'o' },
})
