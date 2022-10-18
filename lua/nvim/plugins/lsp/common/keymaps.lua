local wk = require('which-key')

local lsp = vim.lsp
local diagnostic = vim.diagnostic

local M = {}

function M.on_attach(buffer)
    wk.register({
        name = 'LSP',
        t = { diagnostic.open_float, 'Show line diagnostic' },
        r = { lsp.buf.rename, 'Rename' },
        e = {
            function()
                lsp.buf.format({ async = true })
            end,
            'Code Format',
        },
        a = { lsp.buf.code_action, 'Open code actions' },
        i = { lsp.buf.hover, 'Hover action' },
        o = { lsp.buf.type_definition, 'Type definition' },
        m = { lsp.buf.declaration, 'Declaration' },
        h = { lsp.buf.signature_help, 'Signature help' },
    }, {
        buffer = buffer,
        prefix = '<leader>t',
    })

    wk.register({
        [']d'] = { diagnostic.goto_next, 'Go to next diagnostic' },
        ['[d'] = { diagnostic.goto_prev, 'Go to prev diagnostic' },
    }, {
        buffer = buffer,
    })
end

function M.setup()
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            local buffer = args.buf
            M.on_attach(buffer)
        end,

        group = vim.api.nvim_create_augroup('LSP Keymaps', {}),
    })
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
