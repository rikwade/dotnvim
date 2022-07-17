local Assert = require('nvim.utils.validator.assert')
local RGBColor = require('nvim.utils.color.rgb_color')
local HexColor = require('nvim.utils.color.hex_color')

local M = {}

function M:new(color)
    Assert.is_instance_of_any(
        { RGBColor, HexColor },
        color,
        'Color should be either RGBColor or HexColor'
    )

    color = (getmetatable(color) == HexColor) and color:to_rgb() or color

    local o = {
        color = color,
    }

    setmetatable(o, self)
    self.__index = self
    return o
end

function M:set_contrast(amount)
    Assert.is_number(amount):greater_than_or_equal(0):less_than_or_equal(100)

    local color = self.color
    local red, green, blue = 0, 0, 0
    local f = function(v)
        return math.floor(v)
    end

    local max = math.max(color.red, color.green, color.blue)

    red, green, blue = color.red / max, color.green / max, color.blue / max
    red, green, blue = f(red * 255), f(green * 255), f(blue * 255)
    red, green, blue =
        f(red / 100 * amount), f(green / 100 * amount), f(blue / 100 * amount)

    self.color.red = red
    self.color.green = green
    self.color.blue = blue

    return self
end

function M:get_hex()
    return self.color:to_hex()
end

return M
