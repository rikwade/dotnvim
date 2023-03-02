local Event = {}

function Event:new()
	local o = {
		listeners = {}
	}

	setmetatable(o, self)
	self.__index = self

	return o
end

function Event:add_listener(event, listener)
	if not self.listeners[event] then
		self.listeners[event] = {}
	end

	table.insert(self.listeners[event], listener)
end

function Event:remove_listener(event, listener)
	if not self.listeners[event] then
		return
	end
	table.remove(self.listeners[event], listener)
end

function Event:dispatch(event, ...)
	if self.listeners[event] then
		for _, callback in ipairs(self.listeners[event]) do
			callback(...)
		end
	end
end

return Event
