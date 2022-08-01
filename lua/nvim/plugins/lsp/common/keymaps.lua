local Shortcut = require('nvim.utils.nvim.shortcut')
local Lsp = require('nvim.utils.lsp')
local Event = require('nvim.utils.lsp.event')
local ConfEvent = require('nvim.utils.lsp.config.event')

---@diagnostic disable-next-line: undefined-global
local v = vim
local lsp = v.lsp
local diagnostic = v.diagnostic

local M = {}

function M.on_attach(_, buffer)
    Shortcut():mode('n'):options():buffer(buffer):noremap():next():keymaps({
        -- format the code
        {
            '<leader>p',
            function()
                lsp.buf.format({ async = true })
            end,
        },
    })
end

function M.setup()
    Lsp.add_listener(Event.SERVER_SETUP, function(_, conf)
        conf:add_listener(ConfEvent.ATTACH, M.on_attach)
        return conf
    end)
end

return M
