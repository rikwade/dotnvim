Option = {
    OptionType = {
        GLOBAL_OPTION = 'o',
        WINDOW_OPTION = 'wo',
        BUFFER_OPTION = 'bo'
    },

    -- Add vim options
    addOptions = function (option_type, options)
        print(type(options))

        if type(options) ~= 'table' then
            error('options should be a type of "table"')
            return
        end

        local vim_option = vim[option_type]

        for key, value in pairs(options) do
            vim_option[key] = value
        end
    end,
}