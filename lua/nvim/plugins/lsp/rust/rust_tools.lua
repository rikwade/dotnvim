local rt = require('rust-tools')
local Lsp = require('nvim.utils.lsp')
local LspEventType = require('nvim.utils.lsp.event')

local M = {}

function M.setup_rust_tools()
    require('rust-tools').setup({
        tools = { -- rust-tools options
            autoSetHints = true,
            inlay_hints = {
                show_parameter_hints = true,
                parameter_hints_prefix = '',
                other_hints_prefix = '',
            },
        },

        -- all the opts to send to nvim-lspconfig
        -- these override the defaults set by rust-tools.nvim
        -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
        server = {
            -- on_attach is a callback called when the language server attachs to the buffer
            -- on_attach = on_attach,
            on_attach = function(_, buffer)
                vim.keymap.set(
                    'n',
                    '<C-space>',
                    ':RustHoverAction<cr>',
                    { buffer = buffer }
                )
                -- Code action groups
                vim.keymap.set(
                    'n',
                    '<Leader>a',
                    rt.code_action_group.code_action_group,
                    { buffer = buffer }
                )
            end,
            settings = {
                -- to enable rust-analyzer settings visit:
                -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
                ['rust-analyzer'] = {
                    -- enable clippy on save
                    checkOnSave = {
                        command = 'clippy',
                    },
                },
            },
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
