local M = {}

function M.starts_with(str, starts_with_str)
    return string.sub(str, 1, string.len(starts_with_str)) == str
end

return M
