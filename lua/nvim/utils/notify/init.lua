local notify = require('notify')

local Notify = {}

function Notify:new(config)
	local o = {
		config = config
	}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Notify:notify( message, type)
    notify(message, type, self.config)
end

function Notify:success( message)
    self:notify(message, 'INFO')
end

function Notify:error( message)
    self:notify(message, 'ERROR')
end

function Notify:warn( message)
    self:notify(message, 'WARN')
end

function Notify:info( message)
    self:notify(message, 'INFO')
end

function Notify:debug( message)
    self:notify(message, 'DEBUG')
end

function Notify:trace( message)
    self:notify(message, 'TRACE')
end

return Notify
