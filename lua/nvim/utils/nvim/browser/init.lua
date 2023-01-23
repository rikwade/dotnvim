local log = require('nvim.utils.lua.log')

local M = {}

function M.search_in_google()
	local search_query = vim.fn.input('Query: ')

	M.open(
		string.format('https://www.google.com/search?q=%s', search_query)
	)
end

function M.open(url)
	log.info('opening url', url)
	vim.fn.jobstart({ 'chrome', url })
end

return M
