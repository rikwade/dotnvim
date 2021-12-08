local Lsp = require('nvim.plugins.lsp')
local Event = require('nvim.plugins.lsp.event')

local v = vim
local fn = v.fn
local cmd = v.cmd
local lsp = v.lsp


local M = {}

M.border = {
    { '╭', 'FloatBorder' },

    { '─', 'FloatBorder' },

    { '╮', 'FloatBorder' },

    { '│', 'FloatBorder' },

    { '╯', 'FloatBorder' },

    { '─', 'FloatBorder' },

    { '╰', 'FloatBorder' },

    { '│', 'FloatBorder' },
}

M.signs = {
    Error = ' ﱥ',
    Warning = ' ',
    Hint = ' ',
    Information = ' ',
}

function M.add_ui()
    -- some LS seems to clear the highlight groups
    -- that's why the highlighting related code is defined on attach
    for type, icon in pairs(M.signs) do
        local hl = 'LspDiagnosticsSign' .. type
        fn.sign_define(hl, {
            text = icon,
            texthl = hl,
            numhl = hl,
        })
    end

    cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
    cmd(
        [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
    )

    lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hover, {
        border = M.border,
    })

    lsp.handlers['textDocument/signatureHelp'] = lsp.with(
        lsp.handlers.signature_help,
        {
            border = M.border,
        }
    )

    lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(
        lsp.diagnostic.on_publish_diagnostics,
        {
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = true,
        }
    )
end

function M.setup()
    Lsp.add_listener(Event.END, function()
        M.add_ui()
    end)
end

return M
