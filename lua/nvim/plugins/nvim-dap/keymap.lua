local Shortcut = require('nvim.utils.nvim.shortcut')
local Lsp = require('nvim.plugins.lsp')
local Event = require('nvim.plugins.lsp.event')
local ConfEvent = require('nvim.utils.lsp.event-type')
local CmdString = require('nvim.utils.nvim.command-string')

local l = CmdString.get_lua_cmd_string

local M = {}

function M.on_attach(_, buffer)
    Shortcut:mode('n'):buffer(buffer):options():noremap():next():keymaps({
        -- close the debug sessio
        { ',tS', l('require"dap".close()') },

        -- start the debug session and continue to next breakpoint
        { ',tc', l('require"dap".continue()') },

        -- run last again
        { ',tl', l('require"dap".run_last()') },

        { ',tu', l('require"dap".step_out()') },
        { ',td', l('require"dap".step_over()') },
        { ',ti', l('require"dap".step_into()') },

        -- create and remove a breakpoint
        { ',tt', l('require"dap".toggle_breakpoint()') },

        -- go up in the call stack
        { ',tk', l('require"dap".up()') },

        -- go down in the call stack
        { ',tj', l('require"dap".down()') },

        -- restart the execution
        { ',tr', l('require"dap".restart()') },

        -- inspect node on cursor
        { ',th', l('require"dap.ui.variables".hover()') },

        -- inspect all scope properties
        {
            ',ts',
            l('require"dap.ui.widgets".centered_float(require"dap.ui.widgets".scopes)'),
        },

        -- open repl window
        { ',to', l('require"dap".repl.open()') },
    })

    Shortcut:mode('v'):buffer(buffer):keymaps({
        -- evaluate selected portion
        { ',th', l('require"dap.ui.variables".visual_hover()') },
    })
end

function M.setup()
    Lsp.add_listener(Event.SERVER_SETUP, function(_, conf)
        conf:add_listener(ConfEvent.ATTACH, M.on_attach)
    end)
end

return M
