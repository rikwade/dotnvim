local Lsp = require('nvim.utils.lsp')
local LspEvent = require('nvim.utils.lsp.event')

local M = {}

local function organize_imports()
    local param = {
        command = '_typescript.organizeImports',
        arguments = { vim.api.nvim_buf_get_name(0) },
    }

    vim.lsp.buf.execute_command(param)
end

function M.setup()
    Lsp.add_listener(LspEvent.SERVER_SETUP, function(ls, conf)
        if ls == 'tsserver' then
            local commands = conf:get_option_or_default('commands', {})

            commands.OrganizeImports = {
                organize_imports,
                description = 'Organize Imports',
            }
        end
    end)
end

return M
