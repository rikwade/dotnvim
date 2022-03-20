local Query = {}

function Query.reg_luasnip_queries()
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

return Query
