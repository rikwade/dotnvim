local ls = require('luasnip')
local su = require('nvim.utils.lua.string')
local SnippetManager = require('nvim.plugins.luasnip.snippet_manager')

local s = ls.s
local rep = require('luasnip.extras').rep
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node

local tl = su.box_trim_lines

local sm = SnippetManager('lua')

-- creates a new module
sm:add_snippet(s(
    'mod',
    fmt(
        tl([[
            local {} = {{}}
            
            {}

            return {}
        ]]),
        {
            i(1, 'M'),
            i(2),
            rep(1),
        }
    )
))
