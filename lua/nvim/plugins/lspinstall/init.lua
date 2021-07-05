local lspinstall = require('lspinstall')

local languages = { 'bash',
	'css',
	'dockerfile',
	'html',
	'java',
	'json',
	'lua',
	'python',
	'rust',
	'typescript',
	'vue',
	'yaml'
 }

local install_servers = function()
	for _, lang in ipairs(languages) do
		lspinstall.install_server(lang)
	end
end

return {
	install_servers = install_servers
}
