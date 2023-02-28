local Event = {}

function Event:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.listeners = {}
    return o
end

function Event.add_listener(self, event, listener)
    if not self.listeners[event] then
        self.listeners[event] = {}
    end

    table.insert(self.listeners[event], listener)
end

function Event.remove_listener(self, event, listener)
    if not self.listeners[event] then
        return
    end
    table.remove(self.listeners[event], listener)
end

function Event.dispatch(self, event, ...)
    if self.listeners[event] then
        for _, callback in ipairs(self.listeners[event]) do
            callback(...)
        end
    end
end

return Event
