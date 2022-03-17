local ls = require('luasnip')
local su = require('nvim.utils.lua.string')

-- snippet creator
-- s(<trigger>, <nodes>)
local s = ls.s

-- snippet node
-- sn(<snippet>, <node>)
-- local sn = ls.sn

-- use the cotent from node at <position>
-- rep(<position>)
local rep = require('luasnip.extras').rep

-- formatter
-- fmt(<fmt_string>, {... nodes})
local fmt = require('luasnip.extras.fmt').fmt

-- different types of nodes
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local f = ls.function_node

-- d(<position>, <function() -> ls.sn>)
-- local d = ls.dynamic_node

local tl = su.box_trim_lines

local tabstop = su.get_space_str(vim.opt.tabstop:get())

local M = {}

function M.setup()
    ls.snippets.lua = {
        -- require
        s(
            'rq',
            fmt("local {} = require('{}')", {
                f(function(args)
                    Log.ins(args)
                    local import_parts = vim.split(args[1][1], '.', true)

                    return import_parts[#import_parts] or ''
                end, { 1 }),
                i(1),
            })
        ),

        -- variable
        s(
            'var',
            fmt('{} = {}', {
                c(1, { fmt('local {}', { i(1) }), i(1) }),
                i(2),
            })
        ),

        -- function
        s(
            'fn',
            fmt('{}', {
                c(1, {
                    fmt(
                        tl([[
                            local {} = function({})
                                {}{}
                            end
                        ]]),
                        { i(1), i(2), t(tabstop), i(3) }
                    ),

                    fmt(
                        tl([[
                            function {}({})
                                {}{}
                            end
                        ]]),
                        { i(1), i(2), t(tabstop), i(3) }
                    ),
                }),
            })
        ),

        -- module
        s(
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
        ),

        -- print
        s('so', fmt('print({})', { i(1) })),
    }
end

return M
