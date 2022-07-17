local Assert = require('nvim.utils.validator.assert')

local M = {}

function M:new(red, green, blue)
    Assert.is_number(red, 'red value in RGB is mandetory')
    Assert.is_number(green, 'green value in RGB is mandetory')
    Assert.is_number(blue, 'blue value in RGB is mandetory')

    local o = {
        red = red,
        green = green,
        blue = blue,
    }

    setmetatable(o, self)
    self.__index = self
    return o
end

function M:to_hex()
    local red = string.format('%02x', self.red)
    local green = string.format('%02x', self.green)
    local blue = string.format('%02x', self.blue)

    local HexColor = require('nvim.utils.color.hex_color')
    return HexColor:new(red .. green .. blue)
end

return M
