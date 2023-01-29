local ls = require('luasnip')
local lua = require('snips.lua')
local s = ls.s
local i = ls.insert_node

local M = {}

function M.setup()
	ls.add_snippets('lua', {
		s('f', lua.choices.func(), {
			stored = {
				name = i(1, 'name'),
			},
		}),
		s('fd', lua.choices.func_with_doc(), {
			stored = {
				name = i(1, 'name'),
			},
		}),
		s('mod', lua.choices.module(), {
			stored = {
				name = i(1, 'M'),
			},
		}),
		s('v', lua.choices.variable()),

		s('faa', lua.primitives.anonymous_func()),
		s('fa', lua.primitives.noarg_anonymous_func()),
		s('i', lua.primitives.import()),
		s('o', lua.primitives.stdout()),
		s('oo', lua.primitives.pretty_print()),
		s('td', lua.primitives.test_desc()),
		s('ti', lua.primitives.test_it()),
	})
end

return M
