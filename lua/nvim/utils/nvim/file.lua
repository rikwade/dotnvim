---@diagnostic disable: undefined-global
local str_util = R 'nvim.utils.lua.string'
local wpicker = R 'window-picker'

local M = {}

--[[
-- Reteruns the file path and line number (if exists) under the cursor
-- IF the file does not exists, function will return null
--
-- @return { (file: string, line: number) }
--]]
local function get_file_and_line_under_the_cursor()
    local isfname = vim.o.isfname
    vim.opt.isfname:append(':')

    -- get the file path including line number
    local file_obj = vim.fn.expand('<cfile>:p')
    if file_obj == '' then return end

    local head = vim.fn.fnamemodify(file_obj, ':h')
    local tail = vim.fn.fnamemodify(file_obj, ':t')
    local name = tail
    local line = nil

    -- extract the line number if exists
    if str_util.contains(tail, ':') then
        local split = str_util.split(tail, ':')
        Log.ins(split)
        name = split[1]
        line = split[2]
    end

    local file = head .. '/' .. name

    -- stop if the file does not exist
    if vim.fn.filereadable(file) == 0 then return end

    vim.o.isfname = isfname

    return { file, line }
end

--[[
-- open the file under the cursor of users choice
-- IF there is no more than two window, this will split the window
-- IF the file not found, function will stop
--]]
function M.open_file_under_cursor()
    local file_obj = get_file_and_line_under_the_cursor()

    if not file_obj then return end

    local file = file_obj[1]
    local line = file_obj[2]

    local selectable = wpicker.filter_windows()

    if #selectable < 2 then
        vim.cmd('vsp ' .. file)
    else
        local window = wpicker.pick_window({ include_current_win = true })

        if window then
            vim.api.nvim_set_current_win(window)
            vim.cmd('edit ' .. file)
        else
            return
        end
    end

    if line then
        vim.cmd(line)
        vim.api.nvim_input('zz')
    end
end

return M
