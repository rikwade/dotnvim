local KeybindType = {
    GLOBAL_MAPPING = 'gm',
    BUFFER_MAPPING = 'bm'
}

local Keybind = {
    KeybindType = KeybindType,
    add_keybinds = function (keybind_type, keybinds)
        if type(keybinds) ~= 'table' then
            error('keybinds should be a type of "table"')
            return
        end

        -- global mapping
        if keybind_type == KeybindType.GLOBAL_MAPPING then

            for index, keybind in pairs(keybinds) do
                if(keybind[4] == nil) then
                    keybind[4] = {}
                end

                vim.api.nvim_set_keymap(
                    keybind[1],
                    keybind[2],
                    keybind[3],
                    keybind[4]
                )
            end

        -- buffer mapping
        elseif keybind_type == KeybindType.BUFFER_MAPPING then

            for index, keybind in pairs(keybinds) do
                if(keybind[5] == nil) then
                    keybind[5] = {}
                end
                vim.api.nvim_buf_set_keymap(
                    keybind[1],
                    keybind[2],
                    keybind[3],
                    keybind[4],
                    keybind[5]
                )
            end
        end
    end
}


return Keybind
