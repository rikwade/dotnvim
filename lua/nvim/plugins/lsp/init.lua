local lsp_installer = require('nvim-lsp-installer')
local lsp_installer_servers = require('nvim-lsp-installer.servers')
local Config = require('nvim.utils.lsp.config')
local LspEvent = require('nvim.plugins.lsp.event')
local ConfEvent = require('nvim.utils.lsp.event-type')
local Event = require('nvim.utils.event')
local Notify = require('nvim.utils.notify')

local notify = Notify({
    title = 'Language Server',
})

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

--- Showing notification on server ready
--
-- @param { string } lang - name of the language
function M.lsp_setup_message(lang)
    return function()
        notify:success('Language server:' .. lang .. ' is ready!')
    end
end

local servers = {
    'bashls',
    'cssls',
    'dockerls',
    'eslint',
    'graphql',
    'html',
    'jsonls',
    'jdtls',
    'sumneko_lua',
    'pyright',
    'rust_analyzer',
    'tsserver',
    'volar',
    'groovyls',
}

--- Setup language servers
function M.setup()
    M.lsp_event:dispatch(LspEvent.START)

    for _, server_name in pairs(servers) do
        local server_available, server = lsp_installer_servers.get_server(
            server_name
        )

        if server_available then
            server:on_ready(function()
                local conf = Config()

                -- showing the popup notification
                conf:add_listener(
                    ConfEvent.SERVER_READY,
                    M.lsp_setup_message(server.name)
                )

                M.lsp_event:dispatch(LspEvent.SERVER_SETUP, server.name, conf)

                server:setup(conf)
            end)

            if not server:is_installed() then
                server:install()
            end
        end
    end

    M.lsp_event:dispatch(LspEvent.END)
end

return M
