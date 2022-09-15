local Shortcut = require('nvim.utils.nvim.shortcut')

require('focus').setup()

local split = function(direction)
    return function()
        require('focus').split_command(direction)
    end
end

Shortcut():mode('n'):keymaps({
    { '<tab>h', split('h') },
    { '<tab>i', split('l') },
    { '<tab>n', split('j') },
    { '<tab>e', split('k') },
})
