local Option = require('vim.option')

local OptionType = Option.OptionType;
local add_options = Option.add_options;

local window_options = {
    number = true,
    relativenumber = true,
}

-- adding options
add_options(OptionType.WINDOW_OPTION, window_options)
