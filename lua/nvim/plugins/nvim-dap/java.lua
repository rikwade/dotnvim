local dap = R 'dap'
local Lsp = require 'nvim.plugins.lsp'
local JavaDap = require 'nvim.utils.dap.java'

local java_dap = JavaDap()

local M = {}

function M.on_attach()
    java_dap:get_dap_config():thenCall(
        function(conf)
            dap.configurations.java = conf
        end)
end

function M.setup()
    -- set up the debug config
    dap.adapters.java = function(callback)
        java_dap:start_debug_session():thenCall(
            function(port)
                callback(
                    {
                        type = 'server',
                        host = '127.0.0.1',
                        port = port,
                    })
            end)
    end

    -- add setup event listener
    Lsp.add_setup_event_listener(
        function(ls, conf)
            if ls == 'java' then
                local plugins_path = '/lspinstall/java/additional-plugins/*jar'
                local plugins_str = FN.glob(FN.stdpath('data') .. plugins_path)
                local plugins_path_list = V.split(plugins_str, '\n')

                conf:set_option(
                    'init_options', {
                        bundles = plugins_path_list,
                    })

                conf:add_on_attach_callback(M.on_attach)

                return conf
            end
        end)
end

return M
