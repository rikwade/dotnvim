-- local compe = require('nvim.plugins.nvim-compe')
local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')
local keymaps = require('nvim.plugins.lsp.keymaps')
local ui = require('nvim.plugins.lsp.ui')

local on_attach_callback = function(_, bufnr)
    -- compe.on_attach(bufnr)
    keymaps.on_attach(bufnr)
    ui.on_attach()
end

local setup_servers = function()
    lspinstall.setup()

    local servers = lspinstall.installed_servers()

    vim.schedule(function()
        -- vim.cmd('COQnow')
        for _, lsp in ipairs(servers) do
            --[[
            lspconfig[lsp].setup({
                on_attach = on_attach_callback,
                -- @TODO find out what debounce_text_changes does
                flags = {debounce_text_changes = 20},
            })
        --]]
            lspconfig[lsp].setup(coq.lsp_ensure_capabilities({
                on_attach = on_attach_callback,
                -- @TODO find out what debounce_text_changes does
                flags = {debounce_text_changes = 20},
            }))
        end
    end)

end

setup_servers()
