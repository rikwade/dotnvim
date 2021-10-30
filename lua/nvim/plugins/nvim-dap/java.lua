local dap = R 'dap'
local Lsp = require 'nvim.plugins.lsp'
local LspEventType = require 'nvim.plugins.lsp.event'
local ConfEventType = require 'nvim.utils.lsp.event-type'
local JavaDap = require 'nvim.utils.dap.java'
local Notify = require 'nvim.utils.notify'

local java_dap = JavaDap()
local notify = Notify(
                   {
        title = 'Debugger',
    })

local M = {}

function M.setup_dap_conf()
    java_dap:get_dap_config():thenCall(
        function(conf)
            dap.configurations.java = conf
            notify:success('Java debugger is ready!')
        end):catch(
        function(reason)
            local message = reason.message ~= nil and reason.message or
                                tostring(reason)
            notify:error('Java Dap setup failed! ' .. message)
        end)
end

function M.setup_dap_adapters()
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
end

function M.setup_server_conf(conf)
    local plugins_path = '/lsp_servers/jdtls/additional-plugins/*.jar'
    local plugins_str = FN.glob(FN.stdpath('data') .. plugins_path)
    local plugins_path_list = V.split(plugins_str, '\n')

    conf:set_option(
        'init_options', {
            bundles = plugins_path_list,
        })

    return conf
end

function M.setup()
    Lsp.add_listener(
        LspEventType.SERVER_SETUP, function(ls, conf)
            if ls == 'jdtls' then
                M.setup_dap_adapters()
                M.setup_server_conf(conf)
                conf:add_listener(ConfEventType.SERVER_READY, M.setup_dap_conf)
            end
        end)
end

return M
