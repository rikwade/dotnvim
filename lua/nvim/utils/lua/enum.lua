local class = require 'pl.class'
local Map = require 'pl.Map'
local List = require 'pl.List'
local Assert = require 'nvim.utils.validator.assert.assert'

local Enum = class(Map)

function Enum:_init(values)
    Assert:is_instance_of_any({ Map, List }, values, nil, 'Map | List')

    if List:class_of(values) then
        local index = 0

        values = values:map(
                     function(value)
                index = index + 1

                local obj = {}
                obj[value] = index

                return obj
            end)
    end

    self:super(values)
end

return Enum
