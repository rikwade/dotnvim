local M = {}

function M.count(list)
    local count = 0

    for _, _ in ipairs(list) do
        count = count + 1
    end

    return count
end

function M.concat(...)
    local args = { ... }

    if vim.tbl_count(args) == 0 then
        error('No values passed')
    end

    if vim.tbl_count(args) < 2 then
        error('Passed only one parameter')
    end

    local first = args[1]
    table.remove(args, 1)

    for _, tbl in ipairs(args) do
        for _, value in ipairs(tbl) do
            table.insert(first, value)
        end
    end

    return first
end

function M.filter(tbl, filter)
    local filtered = {}

    for _, value in ipairs(tbl) do
        if filter(value) then
            table.insert(filtered, value)
        end
    end

    return filtered
end

function M.find(tbl, finder)
    for _, value in ipairs(tbl) do
        if finder(value) then
            return value
        end
    end
end

--- Returns true if callback returns true for any of the elements
--- @param list any[] list to run the condition function against
--- @param match_function function function that returns a boolean
function M.some(list, match_function)
	for _, element in ipairs(list) do
		if match_function(element) then
			return true
		end
	end

	return false
end

--- Returns true if callback returns true for all of the elements
--- @param list any[] list to run the condition function against
--- @param match_function function function that returns a boolean
function M.every(list, match_function)
	for _, element in ipairs(list) do
		if not match_function(element) then
			return false
		end
	end

	return true
end

--- Returns true if the given list contains expected_value
function M.contains(list, expected_value)
	for _, element in ipairs(list) do
		if element == expected_value then
			return true
		end
	end

	return false
end

return M
