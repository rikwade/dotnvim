local lspinstall = require('lspinstall')

local languages = { 'bash',
	'dockerfile',
	'lua',
	'python',
	'rust',
 }

local install_servers = function()
	for _, lang in ipairs(languages) do
		lspinstall.install_server(lang)
	end
end

return {
	install_servers = install_servers
}
