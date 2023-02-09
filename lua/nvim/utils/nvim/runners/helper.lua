local M = {}

function M.run_file(executable)
	vim.fn.jobstart(executable .. ' ' .. vim.fn.expand('%'), {
		stderr_buffered = true,
		stdout_buffered = true,
		on_stdout = function(_, data)
			vim.notify(M.table_to_string(data))
		end,
		on_error = function(_, data)
			vim.notify(M.table_to_string(data))
		end
	})
end

function M.table_to_string(tbl)
	if (tbl[#tbl] == '') then
		table.remove(tbl, #tbl)
	end

	return table.concat(tbl, '\n')
end

return M
