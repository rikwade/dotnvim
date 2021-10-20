local lsp_installer = require('nvim-lsp-installer')
local List = require 'pl.List'
local Assert = require 'nvim.utils.validator.assert'
local Config = require 'nvim.utils.lsp.config'

local M = {
    on_setup_callbacks = List(),
}

--- Add callback to be attached on setup event
--
-- @param { (ls, conf) => conf } callback - callback function to be registered
function M.add_setup_event_listener(callback)
    M.on_setup_callbacks:append(callback)
end

--- Callback that handles server setup
function M.on_setup(ls, conf)
    M.on_setup_callbacks:foreach(
        function(callback)
            local updated_config = callback(ls, conf)
            if updated_config then
                Assert:is_instance_of(Config, updated_config, nil, 'Config')
                conf = updated_config
            end
        end)

    return conf
end

--- Setup language servers
function M.setup()
    lsp_installer.on_server_ready(
        function(server)
            local conf = Config()
            local updated_conf = M.on_setup(server.name, conf)
            server:setup(updated_conf)
        end)
end

--  function M.setup()
--  -- add lsp intall configs to lsp config
--  lsp_install.setup()

--  local installed_servers = lsp_install.installed_servers()

--  for _, ls in pairs(installed_servers) do
--  local conf = Config()

--  M.on_setup(ls, conf)

--  lsp_config[ls].setup(conf)
--  end
--  end

return M
