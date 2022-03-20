local ls = require('luasnip')
local su = require('nvim.utils.lua.string')
local ts_utils = require('nvim-treesitter.ts_utils')
local ts_locals = require('nvim-treesitter.locals')
local ts_query = vim.treesitter.query

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

-- d(<position>, <function() -> ls.sn>, <arguments to be passed>)
local d = ls.dynamic_node

local tl = su.box_trim_lines

local tabstop = su.get_space_str(vim.opt.tabstop:get())

-- parse_syntax_tree parse the syntax for the current changes
local parse_syntax_tree = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local language_tree = vim.treesitter.get_parser(bufnr, 'lua')
    language_tree:parse()
end

-- get_current_func_node returns the function node at current cursor point
local get_current_func_node = function()
    local cursor_node = ts_utils.get_node_at_cursor()
    local scope = ts_locals.get_scope_tree(cursor_node, 0)

    local function_node

    for _, node in ipairs(scope) do
        if node:type() == 'function_definition' then
            function_node = node
            break
        end
    end

    return function_node
end

-- reg_luasnip_queries does something
local reg_luasnip_queries = function()
    vim.treesitter.set_query(
        'lua',
        'LuaSnip_FunctionParamNames',
        [[
            (function_definition
                (parameters
                    (identifier) @param))
        ]]
    )
end

local M = {}

function M.setup()
    reg_luasnip_queries()

    ls.snippets.lua = {
        -- require
        s(
            'rq',
            fmt("local {} = require('{}')", {
                f(function(args)
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

        s(
            'fn',
            fmt('{}', {
                c(1, {
                    fmt(
                        tl([[
                            -- {} {}{}
                            local {} = function({})
                                {}{}
                            end
                        ]]),
                        {
                            rep(1),
                            i(4, 'does something'),
                            d(5, function()
                                parse_syntax_tree()
                                local function_node = get_current_func_node()

                                -- immediately return if function_node not found
                                if not function_node then
                                    return sn(nil, t(''))
                                end

                                local param_name_query =
                                    vim.treesitter.get_query(
                                        'lua',
                                        'LuaSnip_FunctionParamNames'
                                    )

                                local comment_lines = { '\n' }
                                local snip_nodes = {}
                                local index = 1

                                for _, nodes, _ in
                                    param_name_query:iter_matches(
                                        function_node,
                                        0
                                    )
                                do
                                    for _, param_node in ipairs(nodes) do
                                        table.insert(
                                            comment_lines,
                                            string.format(
                                                '-- @param {{ {} }} %s {}',
                                                ts_query.get_node_text(
                                                    param_node,
                                                    0
                                                )
                                            )
                                        )

                                        table.insert(
                                            snip_nodes,
                                            i(index, 'type')
                                        )

                                        table.insert(
                                            snip_nodes,
                                            i(
                                                index + 1,
                                                'is a mysterious parameter'
                                            )
                                        )

                                        index = index + 2
                                    end
                                end

                                if #snip_nodes < 1 then
                                    return sn(nil, t(''))
                                end

                                local comment_str = table.concat(
                                    comment_lines,
                                    '\n'
                                )

                                return sn(nil, fmt(comment_str, snip_nodes))
                            end, { 2 }),
                            i(1),
                            i(2),
                            t(tabstop),
                            i(3),
                        }
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
    }
end

return M
