local class = require 'pl.class'
local List = require 'pl.List'
local Map = require 'pl.Map'
local Assert = require 'nvim.utils.validator.assert'

local Config = class(Map)

function Config:_init()
    self.on_attach_callbacks = List()
    self.on_attach = self:on_attach()
end

--- Append on attach callback to config
-- @param { function } callback - callback to be attached
function Config.add_on_attach_callback(self, callback)
    self.on_attach_callbacks:append(callback)
end

--- Set config option
--
-- @param { string } option - name of the option
-- @param { any } value - the value to be appended
function Config.override_option(self, option, value)
    self:set(option, value)
end

--- Set config option
-- IF there is an existing value, this will throw an error
--
-- @param { string } option - name of the option
-- @param { any } value - the value to be appended
function Config.set_option(self, option, value)
    Assert:is_falsy(self:get(option))
    self:set(option, value)
end

--- Append item to config option
-- This assumes the value of the option is a List
-- IF the value is falsy, then new List will be assigned before appending
--
-- @param { string } option - name of the option
-- @param { any } value - the value to be appended
function Config.append_option(self, option, value)
    local existing_value = self:get(option)

    -- if no value, assign a new List
    if not existing_value then self:set(option, List()) end

    Assert:is_instance_of(List, existing_value, nil, 'List')

    self:get(option):append(value)
end

function Config.on_attach(self)
    local this = self

    return function(conf, buffer)
        for _, callback in ipairs(this.on_attach_callbacks) do
            callback(conf, buffer)
        end
    end
end

return Config
