local nvim_lsp = require('nvim_lsp')
local completion = require('completion')
local Keybind = require('vim.keybind')

local on_attach_callback = function(_, bufnr)
    completion.on_attach()

    local opts = { noremap = true }
    local binds = {
        { bufnr, 'n', '<leader>a', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts },
        { bufnr, 'n', '<leader>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts },
        { bufnr, 'n', '<leader>h', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts },
        { bufnr, 'n', '<leader>r', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts },

        { bufnr, 'n', '<leader>j', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts },
        { bufnr, 'n', '<leader>k', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts },

        { bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts },
        { bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts },
        { bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts },
        { bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts },
        { bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts },
        { bufnr, 'n', '<leader>xD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts },
        { bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts },
        { bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts },
        { bufnr, 'n', '<leader>o', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts },
    }

    Keybind.add_keybinds(Keybind.KeybindType.BUFFER_MAPPING, binds)
end

local servers = { 'jdtls', 'sumneko_lua' }

for _, lsp in ipairs(servers) do
    nvim_lsp [lsp].setup {
        on_attach = on_attach_callback,
    }
end
