local Query = {}

Query.queries = {
    LuaSnip_FunctionParamNames = [[
        [
            (function_definition
                (parameters
                    (identifier) @param))
            (function_declaration
                (parameters
                    (identifier) @param))
        ]
    ]],
}

-- Query.setup registers lua treesitter custom queries
function Query.setup()
    for key, value in pairs(Query.queries) do
        vim.treesitter.set_query('lua', key, value)
    end
end

return Query
