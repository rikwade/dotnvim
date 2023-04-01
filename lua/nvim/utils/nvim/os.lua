local M = {}

function M.executable(executable_name)
	return vim.fn.executable(executable_name) == 1
end

return M
