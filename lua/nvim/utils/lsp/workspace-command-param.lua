local WorkspaceCommandParam = {}

function WorkspaceCommandParam:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function WorkspaceCommandParam:_init(arg)
    if type(arg) == 'string' then
        self.command = arg
    elseif type(arg) == 'table' then
        self.command = arg.command
        self.arguments = arg.arguments
    end
end

return WorkspaceCommandParam
