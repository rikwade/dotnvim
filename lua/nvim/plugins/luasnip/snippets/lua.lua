local ls = require('luasnip')

local get_space_str = function(number_of_spaces)
    return string.format('%%-%ds', number_of_spaces):format('')
end

local tabstop = get_space_str(vim.opt.tabstop:get())

ls.snippets = {
    lua = {
        ls.parser.parse_snippet(
            'fn',
            string.format('local $1 = function($2)\n%s$0\nend', tabstop)
        ),
    },
}
