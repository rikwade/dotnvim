local dap = require('dap')
local Shortcut = require('nvim.utils.nvim.shortcut')
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
            { ',tc', JavaDapActions.continue },
        })
    else
        nmap:keymaps({
            { ',tc', dap.continue },
        })
    end

    Shortcut():mode('n'):options():buffer(buffer):noremap():next():keymaps({
        -- close the debug session
        { ',tS', dap.terminate },

        -- start the debug session and continue to next breakpoint

        -- run last again
        { ',tl', dap.run_last },

        { ',tu', dap.step_out },
        { ',td', dap.step_over },
        { ',ti', dap.step_into },

        -- create and remove a breakpoint
        { ',tt', dap.toggle_breakpoint },

        -- go up in the call stack
        { ',te', dap.up },

        -- go down in the call stack
        { ',tn', dap.down },

        -- restart the execution
        { ',tr', dap.restart },

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
        { ',to', dap.repl.open },
    })

    Shortcut():mode('v'):options():buffer(buffer):next():keymaps({
        -- evaluate selected portion
        { ',th', widgets.hover },
    })
end

function M.setup()
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(arg)
            local buffer = arg.buf
            local server_name =
                vim.lsp.get_client_by_id(arg.data.client_id).name

            M.on_attach(server_name, buffer)
        end,
    })
end

return M
