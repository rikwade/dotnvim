local str_util = require('nvim.utils.lua.string')
local log = require('nvim.utils.lua.log')

local M = {}
function M.prompt_google_search()
	local search_query = vim.fn.input('Query: ')
	M.google_search(search_query)
end

function M.google_search(query)
	M.open(string.format('https://www.google.com/search?q=%s', query))
end

function M.open(url)
	log.info('opening url', url)
	vim.fn.jobstart({ 'chrome', url })
end

function M.open_or_search(url)
	if str_util.starts_with(url, 'http://') or str_util.starts_with(url, 'https://') then
		M.open(url)
	else
		M.google_search(url)
	end
end

return M
