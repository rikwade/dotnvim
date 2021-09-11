R 'nvim.plugins.nvim-dap.ui'
R 'nvim.plugins.nvim-dap.java'
R 'nvim.plugins.nvim-dap.keymap'

local M = {}

function M.on_attach(conf, bufnr)
    local module = R(string.format('nvim.plugins.nvim-dap.%s', conf.name))

    if module and module.on_attach then module.on_attach(conf, bufnr) end
end

return M
