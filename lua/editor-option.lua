local Option = require('vim.option')
local OptionType = Option.OptionType;
local add_options = Option.add_options;

local global_options = {
}

local window_options = {
    number = true,
    relativenumber = true;
}

local buffer_options = {
}

-- adding options
add_options(OptionType.GLOBAL_OPTION, global_options)
add_options(OptionType.WINDOW_OPTION, window_options)
add_options(OptionType.BUFFER_OPTION, buffer_options)