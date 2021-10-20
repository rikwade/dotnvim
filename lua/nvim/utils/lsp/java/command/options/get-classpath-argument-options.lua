local class = require 'pl.class'
local List = require 'pl.List'
local SafeMap = require 'nvim.utils.lua.safe-map'

local GetClasspathArgumentOptions = class(SafeMap)

function GetClasspathArgumentOptions:_init(map)
    local allowed_options = List { 'scope' }

    if map then
        self:super(allowed_options, map)
    else
        self:super(allowed_options)
    end
end

return GetClasspathArgumentOptions
