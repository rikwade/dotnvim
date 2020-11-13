local Variable = {
    VariableType = {
        GLOBAL_VARIABLE = 'g',
        WINDOW_VARIABLE = 'w',
        BUFFER_VARIABLE = 'b',
        TAB_PAGE_VARIABLE = 't',
        VIM_VARIABLE = 'v',
    },

    -- Add vim options
    add_variables = function (variable_type, variables)
        if type(variables) ~= 'table' then
            error('variables should be a type of "table"')
            return
        end

        local variable_type = vim[variable_type]

        for key, value in pairs(variables) do
            variable_type[key] = value
        end
    end,
}

return Variable