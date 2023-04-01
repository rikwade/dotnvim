local M = {}

function M:new(language)
	local o = {
		language = language,
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- Adds a new query to current language tree
--- @param name string name used to retrieve the query
--- @param query string tree-sitter query
function M:add_query(name, query)
	vim.treesitter.query.set(self.language, name, query)
end

--- Returns matched nodes iter by given query
--- @param name string name of the query
--- @param buffer number buffer to evaluate the query against. Default to current buffer
function M:get_matches_iter(name, buffer)
	buffer = buffer or 0

	local root =
		vim.treesitter.query.get(buffer, self.language):parse()[1]:root()
	local query = vim.treesitter.query.get(name, self.language)

	return query:iter_matches(root, buffer)
end

return M
