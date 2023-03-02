local ts = vim.treesitter

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
	ts.set_query(self.language, name, query)
end

--- Returns matched nodes iter by given query
--- @param name string name of the query
--- @param buffer number buffer to evaluate the query against. Default to current buffer
function M:get_matches_iter(name, buffer)
	buffer = buffer or 0

	local root = ts.get_parser(buffer, self.language):parse()[1]:root()
	local query = ts.get_query(name, self.language)

	return query:iter_matches(root, buffer)
end

return M
