local Notify = require('nvim.utils.notify')

local notify = Notify({
    title = 'Language Server',
})

local M = {}

--- Showing notification on server ready
--
-- @param { string } lang - name of the language
local function show_message(lang)
    notify:success('Language server: ' .. lang .. ' is ready!')
end

function M.setup()
    local notified = {}

    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(arg)
            local name = vim.lsp.get_client_by_id(arg.data.client_id).name

            if not notified[name] then
                show_message(name)
            end

            notified[name] = true
        end,
        group = vim.api.nvim_create_augroup('Lsp Notify', {}),
    })
end

return M
