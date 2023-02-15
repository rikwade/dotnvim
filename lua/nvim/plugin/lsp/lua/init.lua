local Lsp = require('nvim.utils.lsp')
local LspEventType = require('nvim.utils.lsp.event')

local M = {}

function M.setup()
	Lsp.add_listener(LspEventType.SERVER_SETUP, function(ls, conf)
		if ls == 'lua_ls' then
			conf:set_option('settings', {
				Lua = {
					diagnostics = {
						globals = { 'vim', 'describe', 'it' },
					},
					format = {
						enable = false,
					},
					completion = {
						autoRequire = true,
						callSnippet = 'Replace',
						displayContext = 1,
					},
					hint = {
						arrayIndex = 'Enable',
						setType = true,
					},
					semantic = {
						enable = false,
					},
					workspace = {
						checkThirdParty = false,
						maxPreload = 10000,
						preloadFileSize = 10000,
					},
					telemetry = {
						enable = false,
					},
				},
			})
		end
	end)
end

return M
