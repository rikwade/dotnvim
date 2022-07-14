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
    local pos = diagnostic.get_prev_pos()

    if not pos then
        return
    end

    local row, col = table.unpack(pos)
    return { row + 1, col }
end

local function get_next_diagnostic()
    local pos = diagnostic.get_next_pos()

    if not pos then
        return
    end

    local row, col = table.unpack(pos)
    return { row + 1, col }
end

local function move_to_cursor(get_cursor_callback)
    return function()
        local cursor = get_cursor_callback()

        if not cursor then
            return
        end

        api.nvim_win_set_cursor(0, get_cursor_callback())
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

-- UNUSED
-- add_workspace_folder = <function 1>,
-- clear_references = <function 2>,
-- completion = <function 4>,
-- document_highlight = <function 7>,
-- document_symbol = <function 8>,
-- list_workspace_folders = <function 17>,
-- range_code_action = <function 19>,
-- remove_workspace_folder = <function 22>,
-- workspace_symbol = <function 27>
--
-- USED
-- code_action = <function 3>,
-- declaration = <function 5>,
-- definition = <function 6>,
-- execute_command = <function 9>,
-- format = <function 10>,
-- formatting = <function 11>,
-- formatting_seq_sync = <function 12>,
-- formatting_sync = <function 13>,
-- hover = <function 14>,
-- implementation = <function 15>,
-- incoming_calls = <function 16>,
-- outgoing_calls = <function 18>,
-- range_formatting = <function 20>,
-- references = <function 21>,
-- rename = <function 23>,
-- server_ready = <function 24>,
-- signature_help = <function 25>,
-- type_definition = <function 26>,
