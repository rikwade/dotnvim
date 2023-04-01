local M = {}

--[[
-- Returns the file path and line number (if exists) under the cursor
--
-- @return { (file: string, line: number) }
--]]
function M.get_file_info_under_cursor()
	local isfname = vim.o.isfname
	vim.opt.isfname:append(':')

	-- get the file path including line number
	local text_object = vim.fn.expand('<cfile>')

	if text_object == '' then
		return
	end

	local file_info = vim.split(text_object, ':')

	vim.o.isfname = isfname

	return {
		file = file_info[1],
		row = tonumber(file_info[2] or 1),
		col = tonumber(file_info[3] or 0),
	}
end

--[[
-- open the file under the cursor of users choice
-- IF there is no more than two window, this will split the window
-- IF the file not found, function will stop
--]]
function M.open_file_under_cursor()
	local wpok, wpicker = pcall(require, 'window-picker')

	if not wpok then
		vim.notify('window-picker is not available', vim.log.levels.ERROR)
	end

	local wfok, WFilter =
		pcall(require, 'window-picker.filters.default-window-filter')

	if not wfok then
		vim.notify(
			'window-picker filters are not available',
			vim.log.levels.ERROR
		)
	end

	local file_info = M.get_file_info_under_cursor()

	if not file_info then
		return
	end

	local file = vim.fn.fnamemodify(file_info.file, ':p')
	local row = file_info.row
	local col = file_info.col

	-- stop if the file does not exist
	if vim.fn.filereadable(file) == 0 then
		return
	end

	local win_filter = WFilter:new()
	win_filter:set_config({ include_current_win = true })
	local selectable =
		win_filter:filter_windows(vim.api.nvim_tabpage_list_wins(0))

	if #selectable < 2 then
		vim.api.nvim_set_current_win(selectable[1])
		vim.cmd(string.format('vsp %s', file))

		vim.api.nvim_win_set_cursor(0, { row or 1, col or 0 })
	else
		local window = wpicker.pick_window({
			include_current_win = true,
		})

		if window then
			vim.api.nvim_set_current_win(window)
			vim.cmd('edit ' .. file)
			vim.api.nvim_win_set_cursor(window, { row or 1, col or 0 })
		else
			return
		end
	end

	if row then
		vim.cmd(tostring(row))
		vim.api.nvim_input('zz')
	end
end

return M
