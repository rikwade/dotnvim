local ls = require('luasnip')
local lua = require('snips.kubernetes')
local s = ls.s

local M = {}

function M.setup()
    ls.add_snippets('yaml', {
        s('pod', lua.pod()),
        s('rs', lua.replicaset()),
        s('dep', lua.deployment()),
    })
end

return M
