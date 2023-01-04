local wk = require('which-key')
local rt = require('rust-tools')
local Lsp = require('nvim.utils.lsp')
local LspEventType = require('nvim.utils.lsp.event')

local M = {}

local add_keymaps = function(buffer)
    wk.register({
        name = 'LSP',
        i = { rt.hover_actions.hover_actions, 'Hover action' },
        a = { rt.code_action_group.code_action_group, 'Hover action group' },
    }, {
        buffer = buffer,
        prefix = '<leader>t',
    })

    wk.register({
        name = 'Additional language features',
        t = { '<cmd>RustRun<cr>', 'Run this file' },
        n = { '<cmd>RustRunnables<cr>', 'Run' },
        l = { '<cmd>RustParentModule', 'Go to parent module' },
    }, {
        buffer = buffer,
        prefix = '<leader>s',
    })
end

function M.setup_rust_tools()
    require('rust-tools').setup({
        server = {
            on_attach = function(_, buffer)
                add_keymaps(buffer)
            end,
        },
    })
end

function M.setup()
    Lsp.add_listener(LspEventType.SERVER_SETUP, function(ls, conf)
        if ls == 'rust_analyzer' then
            conf:set_prevent_setup(true)
            M.setup_rust_tools()
        end
    end)
end

return M
