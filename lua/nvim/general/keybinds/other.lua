local wk = require('which-key')

wk.register({
	['<c-c>'] = { '<esc>', 'Escape' },
}, { mode = { 'n', 'v', 'x', 's', 'o', 'i', 'c', 't' } })
