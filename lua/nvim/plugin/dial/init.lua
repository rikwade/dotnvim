local M = {
	'monaqa/dial.nvim',
	keys = { '<c-a>', '<c-x>' },
}

function M.config()
	M.setup()
	M.setup_keymaps()
end

function M.setup()
	local augend = require('dial.augend')

	require('dial.config').augends:register_group({
		default = {
			augend.integer.alias.decimal,
			augend.integer.alias.hex,
			augend.constant.alias.bool,
			augend.date.alias['%Y/%m/%d'],
			augend.date.alias['%d/%m/%Y'],
		},
	})
end

function M.setup_keymaps()
	local wk = require('which-key')

	wk.register({
		name = 'Test',
		['<C-a>'] = { require('dial.map').inc_normal(), 'Increment' },
		['<C-x>'] = { require('dial.map').dec_normal(), 'Decrement' },
	})

	wk.register({
		name = 'Test',
		['<C-a>'] = { require('dial.map').inc_visual(), 'Increment' },
		['<C-x>'] = { require('dial.map').dec_visual(), 'Decrement' },
		['g<C-a>'] = { require('dial.map').inc_gvisual(), 'Increment' },
		['g<C-x>'] = { require('dial.map').dec_gvisual(), 'Decrement' },
	}, {
		mode = 'v',
	})
end

return M
