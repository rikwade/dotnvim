local class = require 'pl.class'
local SafeMap = require 'nvim.utils.lua.safe-map'

local Config = class(SafeMap)

function Config:_init()
    self:super({ 'title', 'timeout' })
end
