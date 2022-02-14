local Lsp = require('nvim.plugins.lsp')
local Event = require('nvim.plugins.lsp.event')
local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')
local HighlightGroups = require('nvim.utils.nvim.highlighting.highlight-groups')

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

local diagnosticHighlightGroups = HighlightGroups({
    DiagnosticLineNrError = 'guibg=#51202A guifg=#FF0000 gui=bold',
    DiagnosticLineNrWarn = 'guibg=#51412A guifg=#FFA500 gui=bold',
    DiagnosticLineNrInfo = 'guibg=#1E535D guifg=#00FFFF gui=bold',
    DiagnosticLineNrHint = 'guibg=#1E205D guifg=#0000FF gui=bold',
})

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

    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true,
    })

    Highlighter:new():add(diagnosticHighlightGroups):register_highlights()

    vim.cmd([[
        sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
        sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
        sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
        sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
    ]])
end

function M.setup()
    Lsp.add_listener(Event.END, function()
        M.add_ui()
    end)
end

return M
