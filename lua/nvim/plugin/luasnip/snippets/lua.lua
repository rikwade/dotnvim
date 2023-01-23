local ls = require('luasnip')
local lua = require('snips.lua')
local s = ls.s
local i = ls.insert_node

local M = {}

function M.setup()
    ls.add_snippets('lua', {
        s('f', lua.function_choice(), {
            stored = {
                name = i(1, 'name'),
            },
        }),
        s('fd', lua.func_with_doc_choice(), {
            stored = {
                name = i(1, 'name'),
            },
        }),
        s('faa', lua.anonymous_func()),
        s('fa', lua.noarg_anonymous_func()),
        s('i', lua.import()),
        s('v', lua.variable_choice()),
        s('o', lua.stdout()),
        s('oo', lua.pretty_print()),
        s('mod', lua.module_choice(), {
            stored = {
                name = i(1, 'M'),
            },
        }),
    })
end

return M
