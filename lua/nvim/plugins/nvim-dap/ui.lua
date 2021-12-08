local Lsp = require('nvim.plugins.lsp')
local Event = require('nvim.plugins.lsp.event')

local v = vim
local fn = v.fn

local M = {}

function M.init()
    v.cmd('highlight DapBreakpoint ctermfg=198 gui=bold guifg=#ff007c')
    v.cmd('highlight DapBreakpointRejected guifg=#FFB13B')
    v.cmd('highlight DapStopped ctermfg=198 guifg=#89e051')
    v.cmd('highlight DapLogPoint guifg=#599eff')
    v.cmd('highlight DapStoppedCursorLine cterm=underline guibg=#1f2d23')

    fn.sign_define('DapBreakpoint', {
        text = '',
        texthl = 'DapBreakpoint',
        linehl = 'CursorLine',
        numhl = 'DapBreakpoint',
    })

    fn.sign_define('DapBreakpointRejected', {
        text = '',
        texthl = 'DapBreakpointRejected',
        linehl = '',
        numhl = 'DapBreakpointRejected',
    })

    fn.sign_define('DapStopped', {
        text = '',
        texthl = 'DapStopped',
        linehl = 'DapStoppedCursorLine',
        numhl = 'DapStopped',
    })

    fn.sign_define('DapLogPoint', {
        text = '﬌',
        texthl = 'DapLogPoint',
        linehl = '',
        numhl = 'DapLogPoint',
    })
end

function M.setup()
    Lsp.add_listener(Event.END, function()
        M.init()
    end)
end

return M
