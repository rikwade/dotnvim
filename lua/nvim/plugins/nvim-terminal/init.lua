local l = Keybind.get_lua_cmd_string
local Terminal = R'nvim-terminal'.Terminal
local Window = R'nvim-terminal'.Window

window = Window:new({pos = 'botright', split = 'sp', height = 15})

terminal = Terminal:new(window)

local opt = {silent = true}

function window:change_height(by)
    local width, height = window:get_size()
    window.height = height + by
    window:update_size()
end

Keybind.g({
    {'n', '<leader>;', l 'terminal:toggle()', opt},
    {'n', '<leader>1', l 'terminal:open(1)', opt},
    {'n', '<leader>2', l 'terminal:open(2)', opt},
    {'n', '<leader>3', l 'terminal:open(3)', opt},
    {'n', '<leader>+', l 'window:change_height(3)', opt},
    {'n', '<leader>-', l 'window:change_height(-3)', opt},
})
