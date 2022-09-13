local ls = require('luasnip')
local kubernetes = require('snips.kubernetes')
local s = ls.s

local M = {}

function M.setup()
    ls.add_snippets('yaml', {
        s('pod', kubernetes.pod()),
        s('rs', kubernetes.replicaset()),
        s('dep', kubernetes.deployment()),
        s('ser', kubernetes.service()),
    })
end

return M
