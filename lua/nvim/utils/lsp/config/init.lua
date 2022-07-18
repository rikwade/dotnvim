local class = require('pl.class')
local List = require('pl.List')
local Map = require('pl.Map')
local Event = require('nvim.utils.event')
local EventType = require('nvim.utils.lsp.config.event')

local Config = class(Map)

function Config:_init()
    self.event = Event()
    self.prevent_setup = false
    self.on_attach = self:get_on_attach()
end

--- Append on attach callback to config
-- @param { function } callback - callback to be attached
function Config.add_listener(self, event, listener)
    self.event:add_listener(event, listener)
    return self
end

--- Remove on attach callback
-- @param { function } callback - callback to be attached
function Config.remove_listener(self, event, callback)
    self.event:remove_listener(event, callback)
    return self
end

-- Config.prevent_setup prevents setup call to lspconfig
-- Some tools handle the setting up process in their plugins such as rust_tools,
-- where they expect not to call the setup() by the user. prevent_setup(true)
-- will not call the setup
--
-- @param { boolean } shouldPreventSetup is whether should skip set up process
-- or not
--
function Config.set_prevent_setup(self, should_prevent_setup)
    self.prevent_setup = should_prevent_setup
    return self
end

--- Set config option
-- IF there is an existing value, this will throw an error
--
-- @param { string } option - name of the option
-- @param { any } value - the value to be appended
function Config.set_option(self, option, value)
    self:set(option, value)
    return self
end

function Config.get_option_or_default(self, option, default_value)
    local value = self:get_option(option)

    if not value then
        return default_value
    end

    return value
end

-- Returns the option value
-- @param { string } option - name of the option to return
function Config.get_option(self, option)
    return self:get(option)
end

--- Append item to config option
-- This assumes the value of the option is a List
-- IF the value is falsy, then new List will be assigned before appending
--
-- @param { string } option - name of the option
-- @param { any } value - the value to be appended
function Config.append_option(self, option, value)
    -- if no value, assign a new List
    if not self:get(option) then
        self:set(option, List())
    end

    self:get(option):append(value)
    return self
end

--- Returns a function that dispatches SERVER_READY for the first time and
-- ATTACH event on consequent events
function Config.get_on_attach(self)
    local this = self

    local callback = nil

    local function attach_callback(...)
        this.event:dispatch(EventType.ATTACH, ...)
    end

    local function server_ready_callback(...)
        this.event:dispatch(EventType.SERVER_READY, ...)
        this.event:dispatch(EventType.ATTACH, ...)
        callback = attach_callback
    end

    callback = server_ready_callback

    local function on_attach(...)
        callback(...)
    end

    return on_attach
end

return Config
