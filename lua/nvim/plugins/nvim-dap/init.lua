R 'nvim.plugins.nvim-dap.java'
R 'nvim.plugins.nvim-dap.keymap'
R 'nvim.plugins.nvim-dap.ui'

local M = {}

function M.on_attach(conf, bufnr)

    local module = nil

    local status = pcall(
                       function()
            module = R(string.format('nvim.plugins.nvim-dap.%s', conf.name))
        end)

    if status and module and module.on_attach then
        module.on_attach(conf, bufnr)
    end
end

return M
