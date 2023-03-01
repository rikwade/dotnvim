local wk = require('which-key')

wk.register({
    ['<c-t>'] = { [[<c-\><c-n>]], 'Go to normal mode' },
}, {
	mode = 't'
})
