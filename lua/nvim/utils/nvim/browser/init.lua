local M = {}

function M.search_in_google()
	local search_query = vim.fn.input('Query: ')

	vim.fn.jobstart({
		'chrome',
		string.format('https://www.google.com/search?q=%s', search_query),
	})
end

return M
