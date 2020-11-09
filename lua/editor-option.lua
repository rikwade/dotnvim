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
Option.addOptions(OptionType.GLOBAL_OPTION, global_options)
Option.addOptions(OptionType.WINDOW_OPTION, window_options)
Option.addOptions(OptionType.BUFFER_OPTION, buffer_options)