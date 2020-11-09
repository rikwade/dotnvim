require('vim.option')

local global_options = {
}

local window_options = {
    number = true,
    relativenumber = true;
}

local buffer_options = {
}

-- adding options
local OptionType = Option.OptionType
Option.add_options(OptionType.GLOBAL_OPTION, global_options)
Option.add_options(OptionType.WINDOW_OPTION, window_options)
Option.add_options(OptionType.BUFFER_OPTION, buffer_options)