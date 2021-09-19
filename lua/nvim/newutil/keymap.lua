---@diagnostic disable-next-line: undefined-global
local v = vim
local api = v.api

R 'nvim.newutil.global'

----------------------------------------------------------------------
--                              Keymap                              --
----------------------------------------------------------------------
local Keymap = {}

function Keymap:new(shortcut)
    self.shortcut = shortcut
    return self
end

function Keymap:__get_action(action)
    if type(action) == 'string' then return action end

    if type(action) == 'function' then
        local key = Global:save(action)
        return string.format('<cmd>lua Global:get(%d)()<cr>', key)
    end

    error('Unexpected type: ' .. type(action) .. ' passed')
end

function Keymap:map(keys, action, options)
    action = self:__get_action(action)
    self.shortcut:__set_keymap(keys, action, options)
    return self
end

function Keymap:next()
    return self.shortcut
end

----------------------------------------------------------------------
--                            KeymapList                            --
----------------------------------------------------------------------
local KeymapList = {}

function KeymapList:new(shortcut)
    self.__shortcut = shortcut
    self.__keymap = Keymap:new(shortcut)
    return self
end

function KeymapList:map(keymaps)
    assert(v.tbl_islist(keymaps), 'KeymapList should be a list')

    for _, record in ipairs(keymaps) do
        self.__keymap:map(record[1], record[2], record[3])
    end

    return self
end

function KeymapList:next()
    return self.__shortcut
end

----------------------------------------------------------------------
--                             Options                              --
----------------------------------------------------------------------
local Options = {}

function Options:new(shortcut)
    self.__shortcut = shortcut
    return self
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

function Options:next()
    return self.__shortcut
end

----------------------------------------------------------------------
--                             Shortcut                             --
----------------------------------------------------------------------
local Shortcut = { __options = {} }

function Shortcut:buffer(bufnr)
    self.__buffer = bufnr
    return self
end

function Shortcut:mode(mode)
    self.__mode = mode
    return self
end

function Shortcut:options()
    return Options:new(self)
end

function Shortcut:keymap()
    return Keymap:new(self)
end

function Shortcut:keymaps()
    return KeymapList:new(self)
end

function Shortcut:__set_option(key, value)
    self.__options[key] = value
end

function Shortcut:__set_keymap(keys, action, options)
    options = options or self.__options

    if self.__buffer then
        api.nvim_buf_set_keymap(
            self.__buffer, self.__mode, keys, action, options)
    else
        api.nvim_set_keymap(self.__mode, keys, action, options)
    end
end

return { Shortcut = Shortcut }
