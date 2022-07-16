local Assert = require('nvim.utils.validator.assert')
local RGBColor = require('nvim.utils.color.rgb_color')

local M = {}

function M:new(hex_value)
    Assert.is_string(hex_value, 'hex value in hex_color should be a string'):length(
        6
    )

    local o = {
        hex = hex_value,
    }

    setmetatable(o, self)
    self.__index = self
    return o
end

function M:to_rgb()
    local red = tonumber(self.value:sub(1, 2), 16)
    local green = tonumber(self.value:sub(3, 4), 16)
    local blue = tonumber(self.value:sub(5, 6), 16)

    return RGBColor:new(red, green, blue)
end

return M
