local Lsp = require('nvim.utils.lsp')
local Event = require('nvim.utils.lsp.event')
local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')
local HighlightGroups = require('nvim.utils.nvim.highlighting.highlight-groups')
local ThemeManager = require('nvim.utils.nvim.theme.theme-manager')
local Contrast = require('nvim.utils.color.contrast')
local HexColor = require('nvim.utils.color.hex_color')
local ColorBuilder = require('nvim.utils.color.color_builder')

local theme = ThemeManager.get_theme()

---@diagnostic disable-next-line: undefined-global
local v = vim
local lsp = v.lsp
local fn = v.fn
local diagnostic = v.diagnostic
local cmd = v.cmd
local api = v.api

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
    DiagnosticLineNrError = {
        guifg = theme.bright.red,
        guibg = theme.normal.red,
    },
    DiagnosticLineNrWarn = {
        guifg = theme.bright.yellow,
        guibg = theme.normal.yellow,
    },
    DiagnosticLineNrInfo = {
        guifg = theme.bright.blue,
        guibg = theme.normal.blue,
    },
    DiagnosticLineNrHint = {
        guifg = theme.bright.cyan,
        guibg = theme.normal.cyan,
    },
})

function M.register_diagnostic_signs()
    fn.sign_define(
        'DiagnosticSignError',
        { text = ' ', texthl = 'DiagnosticSignError' }
    )
    fn.sign_define(
        'DiagnosticSignWarn',
        { text = ' ', texthl = 'DiagnosticSignWarn' }
    )
    fn.sign_define(
        'DiagnosticSignInfo',
        { text = ' ', texthl = 'DiagnosticSignInfo' }
    )
    fn.sign_define(
        'DiagnosticSignHint',
        { text = '', texthl = 'DiagnosticSignHint' }
    )
end

local color_group = api.nvim_create_augroup('FloatHighlight', { clear = true })

function M.add_ui()
    api.nvim_create_autocmd('ColorScheme', {
        pattern = { '*' },
        group = color_group,
        callback = function()
            local float_bg = Contrast
                :new(
                    ColorBuilder
                        :new()
                        :from_highlight('normal', 'background')
                        :to_hex()
                )
                :set_contrast(20)
                :get_hex()
                :to_string()

            Highlighter
                :new()
                :add(HighlightGroups({
                    NormalFloat = { bg = float_bg },
                }))
                :register_highlights()
        end,
    })

    lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hover, {
        border = M.border,
    })

    lsp.handlers['textDocument/signatureHelp'] = lsp.with(
        lsp.handlers.signature_help,
        {
            border = M.border,
        }
    )

    diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
    })

    Highlighter:new():add(diagnosticHighlightGroups):register_highlights()

    cmd([[
        sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
        sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
        sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
        sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
    ]])
end

function M.setup()
    Lsp.add_listener(Event.END, function()
        M.add_ui()
        M.register_diagnostic_signs()
    end)
end

return M
