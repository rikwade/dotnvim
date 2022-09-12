local class = require('pl.class')
local v = vim

----------------------------------------------------------------------
--                             Options                              --
----------------------------------------------------------------------
local Options = class()

function Options:_init(shortcut)
    self.__shortcut = shortcut
end

function Options:noremap(is_noremap)
    is_noremap = is_noremap or true
    self.__shortcut:__set_option('noremap', is_noremap)
    return self
end

function Options:nowait(is_nowait)
    is_nowait = is_nowait or true
    self.__nowait = is_nowait
    return self
end

function Options:silent(is_silent)
    is_silent = is_silent or true
    self.__shortcut:__set_option('silent', is_silent)
    return self
end

function Options:script(is_script)
    is_script = is_script or true
    self.__script = is_script
    self.__shortcut:__set_option('script', is_script)
    return self
end

function Options:expression(is_expression)
    is_expression = is_expression or true
    self.__shortcut:__set_option('expr', is_expression)
    return self
end

function Options:buffer(buffer)
    self.__shortcut:__set_option('buffer', buffer)
    return self
end

function Options:description(description)
    self.__shortcut:__set_option('desc', description)
    return self
end

function Options:next()
    return self.__shortcut
end

----------------------------------------------------------------------
--                             Shortcut                             --
----------------------------------------------------------------------
local Shortcut = class()

function Shortcut:_init()
    self.__options = {}
end

function Shortcut:mode(mode)
    self.__mode = mode
    return self
end

function Shortcut:options()
    return Options(self)
end

function Shortcut:keymap(keys, action, options)
    self:__set_keymap(keys, action, options)
    return self
end

function Shortcut:keymaps(keymaps)
    assert(v.tbl_islist(keymaps), 'Keymap list should be a list')

    for _, record in ipairs(keymaps) do
        self:keymap(record[1], record[2], record[3])
    end

    return self
end

function Shortcut:__set_option(key, value)
    self.__options[key] = value
end

function Shortcut:__set_keymap(key, action, options)
    options = options and v.tbl_extend('force', self.__options, options)
        or self.__options

    local desc = options.desc or options.description
    local global_desc = self.__options.desc

    if desc or global_desc then
        options.desc = (global_desc or '') .. '::' .. (desc or '')
    end

    v.keymap.set(self.__mode, key, action, options)
end

return Shortcut
