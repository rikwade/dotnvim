local KeyBind = {
    KeybindType = {
        GLOBAL_MAPPING = 'gm',
        BUFFER_MAPPING = 'bm'
    },

    add_keybinds = function (keybind_type, keybinds)
        if type(keybinds) ~= 'table' then
            error('keybinds should be a type of "table"')
            return
        end

        local bind_type
        if keybind_type == 'gm' then 
            bind_type = vim.api.nvim_set_keymap
        elseif keybind_type == 'bm' then
            bind_type = vim.api.nvim_buf_set_keymap
        end

        for index, keybind in pairs(keybinds) do

            if(keybind[4] == nil) then
                keybind[4] = {}
            end

            bind_type(
                keybind[0],
                keybind[1],
                keybind[2],
                keybind[3],
                keybind[4]
            )
        end
    end
}

return KeyBind