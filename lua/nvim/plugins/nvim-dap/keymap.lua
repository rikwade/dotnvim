local dap = require('dap')
local Shortcut = require('nvim.utils.nvim.shortcut')
local Lsp = require('nvim.utils.lsp')
local Event = require('nvim.utils.lsp.event')
local ConfEvent = require('nvim.utils.lsp.config.event')
local widgets = require('dap.ui.widgets')
local JavaDapActions = require('nvim.plugins.nvim-dap.java.dap-actions')

local M = {}

function M.on_attach(ls, buffer)
    local nmap = Shortcut():mode('n'):options():buffer(buffer):noremap():next()

    ----------------------------------------------------------------------
    --                    Language specific keymaps                     --
    ----------------------------------------------------------------------
    if ls.name == 'jdtls' then
        nmap:keymaps({
            { ',r', JavaDapActions.continue },
        })
    else
        nmap:keymaps({
            { ',r', dap.continue },
        })
    end

    Shortcut():mode('n'):options():buffer(buffer):noremap():next():keymaps({
        -- close the debug session
        { ',R', dap.terminate },

        -- start the debug session and continue to next breakpoint

        -- run last again
        { ',a', dap.run_last },

        { ',h', dap.step_out },
        { ',n', dap.step_over },
        { ',i', dap.step_into },

        -- create and remove a breakpoint
        { ',t', dap.toggle_breakpoint },

        -- go up in the call stack
        { ',f', dap.up },

        -- go down in the call stack
        { ',p', dap.down },

        -- restart the execution
        { ',s', dap.restart },

        -- inspect node on cursor
        { ',q', widgets.hover },

        -- inspect all scope properties
        {
            ',c',
            function()
                widgets.centered_float(widgets.scopes).open()
            end,
        },

        -- open repl window
        { ',w', dap.repl.open },
    })

    Shortcut():mode('v'):options():buffer(buffer):next():keymaps({
        -- evaluate selected portion
        { ',q', widgets.hover },
    })
end

function M.setup()
    Lsp.add_listener(Event.SERVER_SETUP, function(_, conf)
        conf:add_listener(ConfEvent.ATTACH, M.on_attach)
    end)
end

return M
