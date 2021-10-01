local M = {}

--[[
-- Returns a iterator for all the matches from the query
-- @returns iterator of all the matches
--]]
function M.get_query_matches(buffer, lang, query_str)
    buffer = buffer or API.nvim_get_current_buf()

    local root = TS.get_parser(buffer, lang):parse()[1]:root()

    local query = TS.parse_query(lang, query_str)

    return query:iter_matches(root, buffer)
end

return M