local Shortcut = require('nvim.utils.nvim.shortcut')
local Lsp = require('nvim.utils.lsp')
local Event = require('nvim.utils.lsp.event')
local ConfEvent = require('nvim.utils.lsp.config.event')

local M = {}

function M.on_attach(_, buffer)
    Shortcut():mode('n'):options():buffer(buffer):noremap():next():keymaps({
        -- rename file name
        { '<leader>r', vim.lsp.buf.rename },

        -- format the code
        {
            '<leader>p',
            function()
                vim.lsp.buf.format({ async = true })
            end,
        },

        -- show more information about the current node
        { '<leader>v', vim.lsp.buf.hover },

        -- show diagnostics for current line
        { '<leader>d', vim.diagnostic.open_float },

        -- @todo find out what this is
        { '<leader>f', vim.lsp.buf.declaration },

        -- @todo find out what this is
        { '<leader>w', vim.lsp.buf.signature_help },

        -- @todo find out what this is
        { '<leader>q', vim.lsp.buf.type_definition },

        -- list code actions
        { '<leader>a', vim.lsp.buf.code_action },

        -- jump to next error
        { ']d', vim.diagnostic.goto_next },

        -- jump to previous error
        { '[d', vim.diagnostic.goto_prev },
    })
end

function M.setup()
    Lsp.add_listener(Event.SERVER_SETUP, function(_, conf)
        conf:add_listener(ConfEvent.ATTACH, M.on_attach)
        return conf
    end)
end

return M
