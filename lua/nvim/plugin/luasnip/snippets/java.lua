local ls = require('luasnip')
local java = require('snips.java')
local s = ls.s

local M = {}

function M.setup()
	ls.add_snippets('java', {
		s('o', java.primitives.stdout()),
	})
end

return M
