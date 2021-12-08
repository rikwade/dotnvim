local Lsp = require('nvim.plugins.lsp')
local Command = require('nvim.utils.nvim.command')
local DapCommands = require('nvim.plugins.nvim-dap.java.commands')
local LspEventType = require('nvim.plugins.lsp.event')
local ConfEventType = require('nvim.utils.lsp.event-type')

local M = {}

function M.setup_keymaps(_, _)
    Command:is_buffer_cmd(true):add_all({
        {
            name = 'RunTestClass',
            action = function()
                DapCommands.run_current_test_class()
            end,
        },
        {
            name = 'ShowResults',
            action = function()
                DapCommands.show_results()
            end,
        },
    })
end

function M.setup()
    Lsp.add_listener(LspEventType.SERVER_SETUP, function(ls, conf)
        if ls == 'jdtls' then
            conf:add_listener(ConfEventType.SERVER_READY, M.setup_keymaps)
        end
    end)
end

return M
