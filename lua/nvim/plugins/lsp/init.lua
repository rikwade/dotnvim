local lspconfig = R 'lspconfig'
local lspinstall = R 'lspinstall'
local keymaps = R 'nvim.plugins.lsp.keymaps'
local ui = R 'nvim.plugins.lsp.ui'
local dap = R 'nvim.plugins.nvim-dap'

local on_attach_callback = function(conf, bufnr)
    keymaps.on_attach(bufnr)
    ui.on_attach()
    dap.on_attach(conf, bufnr)
end

local setup_servers = function()
    lspinstall.setup()

    local servers = lspinstall.installed_servers()

    for _, ls in ipairs(servers) do
        local config = { on_attach = on_attach_callback }

        if ls == 'java' then
            config['init_options'] = {
                bundles = {
                    FN.glob(
                        V.loop.os_homedir() ..
                            '/.m2/repository/com/microsoft/java' ..
                            '/com.microsoft.java.debug.plugin/0.32.0/' ..
                            'com.microsoft.java.debug.plugin-0.32.0.jar'),
                },
            }
        end

        lspconfig[ls].setup(config)
    end

end

setup_servers()
