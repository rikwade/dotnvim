local v = vim
local api = v.api

----------------------------------------------------------------------
--                              Keymap                              --
----------------------------------------------------------------------
local Keymap = {}

function Keymap:new(shortcut)
    self.shortcut = shortcut
end

function Keymap:action(action)
    if type(action) == 'string' then
        self.action = action
        return self
    end

    if type(action) == 'function' then
        local key = Global:save(action)
        self.action = string.format('<cmd>lua Globa:get(%d)()<cr>', key)
        return self
    end

    error('Unexpected type: ' .. type(action) .. ' passed')
end

function Keymap:map(map)
    self.map = map
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
    self.shortcut = shortcut
end

function KeymapList:keymap(keymaps)
    assert(v.tbl_islist(keymaps), 'KeymapList should be a list')

    for _, record in ipairs(keymaps) do
        table.insert(self.keymap_list, Keymap:map(record[1]):action(record[2]))
    end

    return self
end

function KeymapList:set()
    for _, keymap in ipairs(self.keymap_list) do self.shortcut:set(keymap) end

    return self.shortcut
end

----------------------------------------------------------------------
--                             Options                              --
----------------------------------------------------------------------
local Options = {}

function Options:new(shortcut)
    self.shortcut = shortcut
end

function Options:nowait(is_nowait)
    is_nowait = is_nowait or true
    self.nowait = is_nowait
end

function Options:silent(is_silent)
    is_silent = is_silent or true
    self.silent = is_silent
end

function Options:script(is_script)
    is_script = is_script or true
    self.script = is_script
end

function Options:expression(is_expression)
    is_expression = is_expression or true
    self.expression = true
end

function Options:set()
    self.shortcut:set(self)
    return self.shortcut
end

----------------------------------------------------------------------
--                             Shortcut                             --
----------------------------------------------------------------------
local Shortcut = { mode = 'n', options = {} }

function Shortcut:buffer(is_buffer_or_buf_num)
    assert(
        is_buffer_or_buf_num == true,
        'Please pass the buffer number instead of true')

    self.buffer = is_buffer_or_buf_num or false
end

function Shortcut:mode(mode)
    self.mode = mode
end

function Shortcut:options()
    self.options = Options:new(self)
    return self.options
end

function Shortcut:keymap()
    self.keymap = Keymap:new(self)

    return self.keymap
end

function Shortcut:keymaps()
    self.keymap = KeymapList:new(self)
    return self.keymap
end

function Shortcut:set(keymap)
    if self.buffer then
        api.nvim_buf_set_keymap(
            self.buffer, self.mode, keymap.map, keymap.action, self.options)

    else
        api.nvim_set_keymap(self.mode, keymap.map, keymap.action, self.options)
    end
end

return { Keymap, KeymapList, Shortcut, Options }
