local Lsp = require 'nvim.plugins.lsp'
local Event = require 'nvim.plugins.lsp.event'

local M = {}

function M.init()
    V.cmd('highlight DapBreakpoint ctermfg=198 gui=bold guifg=#ff007c')
    V.cmd('highlight DapBreakpointRejected guifg=#FFB13B')
    V.cmd('highlight DapStopped ctermfg=198 guifg=#89e051')
    V.cmd('highlight DapLogPoint guifg=#599eff')
    V.cmd('highlight DapStoppedCursorLine cterm=underline guibg=#1f2d23')

    FN.sign_define(
        'DapBreakpoint', {
            text = '',
            texthl = 'DapBreakpoint',
            linehl = 'CursorLine',
            numhl = 'DapBreakpoint',
        })

    FN.sign_define(
        'DapBreakpointRejected', {
            text = '',
            texthl = 'DapBreakpointRejected',
            linehl = '',
            numhl = 'DapBreakpointRejected',
        })

    FN.sign_define(
        'DapStopped', {
            text = '',
            texthl = 'DapStopped',
            linehl = 'DapStoppedCursorLine',
            numhl = 'DapStopped',
        })

    FN.sign_define(
        'DapLogPoint', {
            text = '﬌',
            texthl = 'DapLogPoint',
            linehl = '',
            numhl = 'DapLogPoint',
        })
end

function M.setup()
    Lsp.add_listener(
        Event.END, function()
            M.init()
        end)
end

return M
