local dap = require('dap')
local JavaDap = require('nvim.utils.dap.java')
local Notify = require('nvim.utils.notify')
local java_dap = JavaDap()

local notify = Notify({
    title = 'Debugger',
})

local M = {}

function M.continue()
    java_dap
        :get_dap_config()
        :thenCall(function(conf)
            dap.configurations.java = conf
            dap.continue()
        end)
        :catch(function(reason)
            local message = 'Something went wrong'

            if type(reason) == 'string' then
                message = reason
            elseif type(reason) == 'table' then
                if reason.message then
                    message = reason.message
                end
            end

            notify:error('Java Dap setup failed! ' .. message)
        end)
end

return M
