local M = {}

function M.jump_forward()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local count = vim.v.count

	if count == 0 then
		cursor[1] = cursor[1] + 1
		vim.api.nvim_win_set_cursor(0, cursor)
	else
		local last_line = vim.api.nvim_buf_line_count(0)

		vim.cmd("normal! m'")

		if last_line < count then
			vim.api.nvim_win_set_cursor(0, { last_line, cursor[2] })
		else
			vim.api.nvim_win_set_cursor(0, { cursor[1] + count, cursor[2] })
		end
	end
end

function M.jump_backward()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local count = vim.v.count

	if count == 0 then
		cursor[1] = cursor[1] - 1
		vim.api.nvim_win_set_cursor(0, cursor)
	else
		vim.cmd("normal! m'")

		if 0 > (cursor[1] - count) then
			vim.api.nvim_win_set_cursor(0, { 0, cursor[2] })
		else
			vim.api.nvim_win_set_cursor(0, { cursor[1] - count, cursor[2] })
		end
	end
end

return M
