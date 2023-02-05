local M = {}

function M.move(reverse)
	local move_char = reverse and 'k' or 'j'
	local count = vim.v.count

	if count == 0 then
		vim.cmd(("normal! %s"):format(move_char))
	else
		vim.cmd("normal! m'")
		vim.cmd(("normal! %d%s"):format(count, move_char))
	end
end

function M.move_down()
	M.move()
end

function M.move_up()
	M.move(true)
end

return M
