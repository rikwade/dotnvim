local Shortcut = require('nvim.utils.nvim.shortcut')
local Lsp = require('nvim.utils.lsp')
local Event = require('nvim.utils.lsp.event')
local ConfEvent = require('nvim.utils.lsp.config.event')
local widgets = require('dap.ui.widgets')

local M = {}

function M.on_attach(_, buffer)
    Shortcut():mode('n'):options():buffer(buffer):noremap():next():keymaps({
        -- close the debug sessio
        { ',tS', require('dap').terminate },

        -- start the debug session and continue to next breakpoint
        { ',tc', require('dap').continue },

        -- run last again
        { ',tl', require('dap').run_last },

        { ',tu', require('dap').step_out },
        { ',td', require('dap').step_over },
        { ',ti', require('dap').step_into },

        -- create and remove a breakpoint
        { ',tt', require('dap').toggle_breakpoint },

        -- go up in the call stack
        { ',te', require('dap').up },

        -- go down in the call stack
        { ',tn', require('dap').down },

        -- restart the execution
        { ',tr', require('dap').restart },

        -- inspect node on cursor
        { ',th', widgets.hover },

        -- inspect all scope properties
        {
            ',ts',
            function()
                widgets.centered_float(widgets.scopes).open()
            end,
        },

        -- open repl window
        { ',to', require('dap').repl.open },
    })

    Shortcut():mode('v'):options():buffer(buffer):next():keymaps({
        -- evaluate selected portion
        { ',th', widgets.hover },
    })
end

function M.setup()
    Lsp.add_listener(Event.SERVER_SETUP, function(_, conf)
        conf:add_listener(ConfEvent.ATTACH, M.on_attach)
    end)
end

return M
