local ls = require('luasnip')
local jsr = require('snips.javascriptreact')
local s = ls.s

local M = {}

function M.setup()
    local snippets = function()
        return {
            s('c', jsr.component()),
            s('hs', jsr.use_state()),
            s('he', jsr.use_effect()),
        }
    end

    ls.add_snippets('javascriptreact', snippets())
    ls.add_snippets('typescriptreact', snippets())
end

return M
