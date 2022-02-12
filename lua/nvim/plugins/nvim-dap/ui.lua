local Lsp = require('nvim.plugins.lsp')
local Event = require('nvim.plugins.lsp.event')
local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')
local HighlightGroups = require('nvim.utils.nvim.highlighting.highlight-groups')

local v = vim
local fn = v.fn

local dap_highlight_groups = HighlightGroups({
    DapBreakpoint = 'ctermfg=198 gui=bold guifg=#ff007c',
    DapBreakpointRejected = 'guifg=#FFB13B',
    DapStopped = 'ctermfg=198 guifg=#89e051',
    DapLogPoint = 'guifg=#599eff',
    DapStoppedCursorLine = 'cterm=underline guibg=#1f2d23',
})

local M = {}

function M.init()
    Highlighter:new():add(dap_highlight_groups):register_highlights()

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
