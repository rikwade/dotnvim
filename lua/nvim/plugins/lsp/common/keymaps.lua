local Shortcut = require('nvim.utils.nvim.shortcut')
local Lsp = require('nvim.utils.lsp')
local Event = require('nvim.utils.lsp.event')
local ConfEvent = require('nvim.utils.lsp.config.event')

---@diagnostic disable-next-line: undefined-global
local v = vim
local api = v.api
local lsp = v.lsp
local diagnostic = v.diagnostic

local function get_prev_diagnostic()
    local row, col = table.unpack(diagnostic.get_prev_pos())
    return { row + 1, col }
end

local function get_next_diagnostic()
    local row, col = table.unpack(diagnostic.get_next_pos())
    return { row + 1, col }
end

local function move_to_cursor(get_cursor_func)
    return function()
        api.nvim_win_set_cursor(0, get_cursor_func())
    end
end

local M = {}

function M.on_attach(_, buffer)
    Shortcut():mode('n'):options():buffer(buffer):noremap():next():keymaps({
        -- rename file name
        { '<leader>r', lsp.buf.rename },

        -- format the code
        {
            '<leader>p',
            function()
                lsp.buf.format({ async = true })
            end,
        },

        -- show more information about the current node
        { '<leader>v', lsp.buf.hover },

        -- show diagnostics for current line
        { '<leader>d', diagnostic.open_float },

        -- @todo find out what this is
        { '<leader>f', lsp.buf.declaration },

        -- @todo find out what this is
        { '<leader>w', lsp.buf.signature_help },

        -- @todo find out what this is
        { '<leader>q', lsp.buf.type_definition },

        -- list code actions
        { '<leader>a', lsp.buf.code_action },

        -- jump to next error
        { ']d', move_to_cursor(get_next_diagnostic) },

        -- jump to previous error
        { '[d', move_to_cursor(get_prev_diagnostic) },
    })
end

function M.setup()
    Lsp.add_listener(Event.SERVER_SETUP, function(_, conf)
        conf:add_listener(ConfEvent.ATTACH, M.on_attach)
        return conf
    end)
end

return M
