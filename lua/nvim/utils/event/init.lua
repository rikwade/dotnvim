local class = require 'pl.class'
local List = require 'pl.List'

local Event = class()

function Event:_init()
    self.listeners = {}
end

function Event.add_listener(self, event, listener)
    if not self.listeners[event] then 
        self.listeners[event] = List()
    end

    self.listeners[event]:append(listener)
end

function Event.dispatch(self, event, ...)
    if self.listeners[event] then
        for callback in self.listeners[event]:iter() do
            callback(...)
        end
    end
end

return Event
