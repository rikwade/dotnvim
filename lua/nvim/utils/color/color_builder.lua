local HexColor = require('nvim.utils.color.hex_color')
local Assert = require('nvim.utils.validator.assert')

---@diagnostic disable-next-line: undefined-global
local v = vim
local api = v.api

local M = {}

function M:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function M:from_nvim_rgb(rgb)
    local hex = string.format('%x', rgb)

    self.color = HexColor:new(hex):to_rgb()

    return self
end

function M:from_highlight(hl_name, key)
    local rgb = api.nvim_get_hl_by_name(hl_name, true)[key]

    self:from_nvim_rgb(rgb)

    return self
end

function M:set_red(red)
    Assert.is_number(red):greater_than_or_equal(0):less_than_or_equal(255)

    self.color.red = red

    return self
end

function M:set_green(green)
    Assert.is_number(green):greater_than_or_equal(0):less_than_or_equal(255)

    self.color.green = green

    return self
end

function M:set_blue(blue)
    Assert.is_number(blue):greater_than_or_equal(0):less_than_or_equal(255)

    self.color.blue = blue

    return self
end

function M:to_rgb()
    return self.color
end

function M:to_hex()
    return self.color:to_hex()
end

return M
