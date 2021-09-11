local java_util = R 'nvim.utils.lsp.java'
local dap = R 'dap'

dap.adapters.java = function(callback)
    java_util.start_debug_session(
        function(port)
            callback({ type = 'server', host = '127.0.0.1', port = port })
        end
    )
end

local M = {}

function M.on_attach()
    java_util.get_dap_config(function(conf)
        Log.ins(conf)
        dap.configurations.java = conf
    end)
end

return M
