local ls = require('luasnip')
local js = require('snips.javascript')

local s = ls.s
local i = ls.insert_node

local M = {}

function M.setup()
    local snippets = function()
        return {
            s('f', js.function_context(), {
                stored = {
                    name = i(1, 'name'),
                    param = i(1),
                    body = i(1),
                },
            }),
            s('o', js.stdout_choice(), {
                stored = {
                    value = i(1, 'value'),
                },
            }),
            s('con', js.constructor()),
            s('c', js.class()),
        }
    end

    ls.add_snippets('javascript', snippets())
    ls.add_snippets('typescript', snippets())
    ls.add_snippets('javascriptreact', snippets())
    ls.add_snippets('typescriptreact', snippets())
end

return M
