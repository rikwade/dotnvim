local lsp_util = R 'nvim.utils.lsp'
local java_util = R 'nvim.utils.lsp.java'
local dap = R 'dap'

dap.adapters.java = function(callback)
    java_util.start_debug_session(
        function(port)
            callback(
                {
                    type = 'server',
                    host = '127.0.0.1',
                    port = port,
                })
        end)
end

local function on_setup(config)

    local bundles_str = FN.glob(
                            FN.stdpath('data') ..
                                '/lspinstall/java/additional-plugins/*jar')

    local bundles = V.split(bundles_str, '\n')

    config['init_options'] = {
        bundles = bundles,
    }
end

local M = {}

function M.on_attach()
    java_util.get_dap_config(
        function(conf)
            dap.configurations.java = conf
        end)
end

return M
