local Lsp = require('nvim.plugins.lsp')
local Event = require('nvim.plugins.lsp.event')
local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')
local HighlightGroups = require('nvim.utils.nvim.highlighting.highlight-groups')
local Colors = require('nvim.utils.theme.colors')

local v = vim
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

local diagnosticHighlightGroups = HighlightGroups({
    DiagnosticLineNrError = string.format(
        'guifg=%s guibg=%s gui=bold',
        Colors.ERROR,
        Colors.ERROR_BG
    ),

    DiagnosticLineNrWarn = string.format(
        'guifg=%s guibg=%s gui=bold',
        Colors.WARN,
        Colors.WARN_BG
    ),
    DiagnosticLineNrInfo = string.format(
        'guifg=%s guibg=%s gui=bold',
        Colors.INFO,
        Colors.INFO_BG
    ),
    DiagnosticLineNrHint = string.format(
        'guifg=%s guibg=%s gui=bold',
        Colors.HINT,
        Colors.HINT_BG
    ),
})

function M.add_ui()
    cmd(
        string.format(
            'autocmd ColorScheme * highlight NormalFloat guibg=#1f2335'
        )
    )
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
