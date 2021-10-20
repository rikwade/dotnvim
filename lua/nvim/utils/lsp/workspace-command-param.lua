local class = require 'pl.class'
local List = require 'pl.List'
local WorkspaceCommandParam = class()

function WorkspaceCommandParam:_init(arg)
    -- string or table check
    assert(
        type(arg) == 'string' or type(arg) == 'table',
        'WorkspaceCommandParam: expected arg to be string or table but passed ' ..
            tostring(arg))

    -- table arg.command property check
    assert(
        type(arg) == 'table' and type(arg.commad) == 'string',
        'WorkspaceCommandParam: arg.commad: string is mandetory but passed ' ..
            tostring(arg))

    -- table arg.arguments property check
    assert(
        type(arg) == 'table' and arg:class_of(arg.arguments),
        'WorkspaceCommandParam: arg.arguments: string is mandetory but passed ' ..
            tostring(arg))

    if type(arg) == 'string' then
        self.command = arg
    elseif type(arg) == 'table' then
        self.command = arg.commad
        self.arguments = arg.arguments
    end
end

return WorkspaceCommandParam
