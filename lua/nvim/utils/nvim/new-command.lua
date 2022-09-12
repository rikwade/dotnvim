local Options = {}

function Options:new(o)
    o = o or {}

    o.__options = {}

    setmetatable(o, self)
    self.__index = self
    return o
end

function Options:next()
    return self.__parent
end

function Options:description(description)
    self.__options.desc = description
    return self
end

function Options:force(force)
    self.__options.force = force
    return self
end

function Options:preview(preview)
    self.__options.preview = preview
    return self
end

function Options:get()
    return self.__options
end

-- nargs=0    No arguments are allowed (the default)
-- nargs=1    Exactly one argument is required, it includes spaces
-- nargs=*    Any number of arguments are allowed (0, 1, or many), separated by white space
-- nargs=?    0 or 1 arguments are allowed
-- nargs=+    Arguments must be supplied, but any number are allowed
function Options:nargs(nargs)
    self.__options.nargs = nargs
end

local Command = {}

function Command:new(o)
    o = o or {}

    o.__options = Options:new()
    o.__options.__parent = self

    setmetatable(o, self)
    self.__index = self
    return o
end

function Command:options()
    return self.__options
end

function Command:add(name, command, options)
    options = options and vim.tbl_extend('force', self.__options:get(), options)
        or self.__options:get()

    vim.api.nvim_create_user_command(name, command, options)
end

function Command:add_all(command_list)
    for _, command in ipairs(command_list) do
        self:add(command[1], command[2], command[3])
    end
end

return Command
