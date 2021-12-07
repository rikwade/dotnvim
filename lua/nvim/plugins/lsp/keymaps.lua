local Shortcut = R('nvim.newutil.keymap')
local Lsp = require('nvim.plugins.lsp')
local Event = require('nvim.plugins.lsp.event')
local ConfEvent = require('nvim.utils.lsp.event-type')
local l = Keybind.get_lua_cmd_string

local M = {}

function M.on_attach(_, buffer)
    Shortcut:mode('n'):buffer(buffer):options():noremap():next():keymaps({

        -- go to definition of the current node
        -- REPLACED WITH telescope keymap
        -- { '<BS>t', l 'vim.lsp.buf.definition()' },

        -- go to the implementation of the current interface node
        -- REPLACED WITH telescope keymap
        -- { '<BS>s', l 'vim.lsp.buf.implementation()' },

        -- rename file name
        { '<BS>r', l('vim.lsp.buf.rename()') },

        -- quick fix actions
        { '<BS>a', l('vim.lsp.buf.code_action()') },

        -- show more information about the current node
        { '<BS>n', l('vim.lsp.buf.hover()') },

        -- jump to next error
        { ']d', l('vim.lsp.diagnostic.goto_next()') },

        -- jump to previous error
        { '[d', l('vim.lsp.diagnostic.goto_prev()') },

        -- show diagnostics for current line
        { '<BS>p', l('vim.lsp.diagnostic.show_line_diagnostics()') },

        -- show all diagnostics in the current file
        { '<BS>c', l('vim.lsp.diagnostic.set_loclist()') },

        -- create folder
        -- @TODO fail with error
        { '<BS>wa', l('vim.lsp.buf.add_workspace_folder()') },

        -- remove folder
        -- @TODO fail without error
        { '<BS>nr', l('vim.lsp.buf.remove_workspace_folder()') },

        -- show workspace folders
        {
            '<BS>nl',
            l('print(vim.inspect(vim.lsp.buf.list_workspace_folders()))'),
        },

        -- @todo find out what this is
        { '<BS>f', l('vim.lsp.buf.declaration()') },

        -- @todo find out what this is
        { '<BS>o', l('vim.lsp.buf.signature_help()') },

        -- @todo find out what this is
        { '<BS>u', l('vim.lsp.buf.type_definition()') },

        -- telescope overrides this functionality
        -- REPLACED WITH telescope keymap
        -- { '<BS>r', l 'vim.lsp.buf.references()',  },
    })
end

function M.setup()
    Lsp.add_listener(Event.SERVER_SETUP, function(_, conf)
        conf:add_listener(ConfEvent.ATTACH, M.on_attach)
        return conf
    end)
end

return M
