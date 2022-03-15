local ls = require('luasnip')

-- snippet creator
-- s(<trigger>, <nodes>)
local s = ls.s

-- snippet node
-- sn(<snippet>, <node>)
local sn = ls.sn

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
local d = ls.dynamic_node

local get_space_str = function(number_of_spaces)
    return string.format('%%-%ds', number_of_spaces):format('')
end

local get_line_iter = function(str)
    if str:sub(-1) ~= '\n' then
        str = str .. '\n'
    end
    return str:gmatch('(.-)\n')
end

local trim_lines = function(str)
    local new_str = ''

    for line in get_line_iter(str) do
        line = line:gsub('^%s+', '')
        line = string.gsub(line, '%s+$', '')
        new_str = new_str .. '\n' .. line
    end

    return new_str
end

local tl = trim_lines

local tabstop = get_space_str(vim.opt.tabstop:get())

ls.snippets = {
    lua = {
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
    },
}
