local lsp_installer = require('nvim-lsp-installer')
local Config = require 'nvim.utils.lsp.config'
local LspEvent = require 'nvim.plugins.lsp.event'
local ConfEvent = require 'nvim.utils.lsp.event-type'
local Event = require 'nvim.utils.event'
local Notify = require 'nvim.utils.notify'

local notify = Notify {
    title = 'Language Server',
}

local M = {
    lsp_event = Event(),
}

--- Add event listener
--
-- @param { Event } event - event type
-- @param { Function } listener - callback function to call on event
function M.add_listener(event, listener)
    M.lsp_event:add_listener(event, listener)
end

function M.lsp_setup_message(lang)
    return function()
        notify:success('Language server:' .. lang .. ' is ready!')
    end
end

--- Setup language servers
function M.setup()
    M.lsp_event:dispatch(LspEvent.START)

    lsp_installer.on_server_ready(
        function(server)
            local conf = Config()

            conf:add_listener(
                ConfEvent.SERVER_READY, M.lsp_setup_message(server.name))

            M.lsp_event:dispatch(LspEvent.SERVER_SETUP, server.name, conf)

            server:setup(conf)
        end)

    M.lsp_event:dispatch(LspEvent.END)
end

return M
