local Lsp = require 'nvim.plugins.lsp'
local Event = require 'nvim.plugins.lsp.event'

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
        FN.sign_define(
            hl, {
                text = icon,
                texthl = hl,
                numhl = hl,
            })
    end

    CMD([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
    CMD(
        [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

    LSP.handlers['textDocument/hover'] = LSP.with(
                                             LSP.handlers.hover, {
            border = M.border,
        })

    LSP.handlers['textDocument/signatureHelp'] = LSP.with(
                                                     LSP.handlers.signature_help,
                                                     {
            border = M.border,
        })

    LSP.handlers['textDocument/publishDiagnostics'] = LSP.with(
                                                          LSP.diagnostic
                                                              .on_publish_diagnostics,
                                                          {
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = true,
        })
end

function M.setup()
    Lsp.add_listener(
        Event.END, function()
            M.add_ui()
        end)
end

return M
