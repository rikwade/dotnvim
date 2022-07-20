local Assert = require('nvim.utils.validator.assert')
local RGBColor = require('nvim.utils.color.rgb_color')
local HexColor = require('nvim.utils.color.hex_color')

local r = function(v)
    return math.floor(v + 0.5)
end

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

---Set contrast to given percentage
---@param { number } amount percentage to change the color
---@return { self }
function M:set_contrast(amount)
    Assert.is_number(amount):greater_than_or_equal(0):less_than_or_equal(100)

    local color = self.color
    local red, green, blue = 0, 0, 0

    local max = math.max(color.red, color.green, color.blue)

    red, green, blue = color.red / max, color.green / max, color.blue / max
    red, green, blue = r(red * 255), r(green * 255), r(blue * 255)
    red, green, blue =
        r(red / 100 * amount), r(green / 100 * amount), r(blue / 100 * amount)

    self.color.red = red
    self.color.green = green
    self.color.blue = blue

    return self
end

---Increase the contrast by the percentage
---@param amount number amount to increase the contrast by
---@return { self }
function M:change_contrast_by(amount)
    Assert.is_number(amount):greater_than_or_equal(-100):less_than_or_equal(100)

    local increase = amount >= 0 or false
    local color = self.color
    local red, green, blue = self.color.red, self.color.green, self.color.blue

    local max = math.max(red, green, blue)

    red, green, blue = red / max, green / max, blue / max

    local red_amount, green_amount, blue_amount =
        red * 2.55 * amount, green * 2.55 * amount, blue * 2.55 * amount

    red, green, blue =
        r(color.red + red_amount),
        r(color.green + green_amount),
        r(color.blue + blue_amount)

    if increase then
        max = math.max(red, green, blue)

        if max > 255 then
            self:set_contrast(100)
            return self
        end
    else
        local min = math.min(red, green, blue)

        if min < 0 then
            self:set_contrast(1)
            return self
        end
    end

    self.color.red = red
    self.color.green = green
    self.color.blue = blue

    return self
end

function M:get_hex()
    return self.color:to_hex()
end

return M
