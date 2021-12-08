local Popup = require('nui.popup')
local event = require('nui.utils.autocmd').event
local Shortcut = R('nvim.newutil.keymap')
local TestStatus = require('nvim.utils.dap.java.test.test-status')
local TestEventType = require('nvim.utils.dap.java.test.test-event-type')
local Buffer = require('nvim.utils.ui.buffer')
local Highlight = require('nvim.utils.highlight')
local TestHighlightGroup = require('nvim.plugins.nvim-dap.highlight-group')

local v = vim
local api = v.api

local highlights = Highlight:new():save_all(TestHighlightGroup)

local popup = Popup({
    enter = true,
    focusable = true,
    border = {
        style = 'rounded',
        highlight = 'FloatBorder',
    },
    position = '50%',
    size = {
        width = '60%',
        height = '60%',
    },
    buf_options = {
        modifiable = true,
        readonly = false,
    },
    win_options = {
        foldmethod = 'indent',
        foldlevel = 0,
    },
})

local M = {}

function M:new(test_result_sub)
    self.results = {}

    test_result_sub.add_listener(TestEventType.COMPLETE, function(...)
        M:_on_test_complete(...)
    end)
    return self
end

function M:show()
    popup:mount()

    -- remove the window on exit
    popup:on(event.BufLeave, function()
        popup:unmount()
    end)

    Shortcut
        :mode('n')
        :buffer(popup.bufnr)
        :options()
        :noremap()
        :next()
        :keymaps({ { '<cr>', 'zA' }, { 'o', 'zA' } })

    local buffer_ui = Buffer:new({
        buffer = popup.bufnr,
        highlights = highlights,
    })

    local line_count = api.nvim_buf_line_count(popup.bufnr)
    local lines = {}

    for _, result in ipairs(self.results) do
        for _, line in ipairs(result) do
            table.insert(lines, line)
        end
    end

    highlights:register_all()
    buffer_ui:render(lines, line_count - 1, line_count)
end

function M:_on_test_complete(result)
    local parsed_lines = self._get_buffer_lines(result)
    table.insert(self.results, parsed_lines)
end

function M._get_buffer_lines(test_case_result)
    local lines = {}
    local status = ''
    local class = test_case_result.class
    local name = test_case_result.name

    if test_case_result.status == TestStatus.PASS then
        status = {
            text = '' .. ' ' .. class .. '  ' .. name,
            color_group = 'TestPassed',
        }
    elseif test_case_result.status == TestStatus.FAIL then
        status = {
            text = '' .. ' ' .. class .. '  ' .. name,
            color_group = 'TestError',
        }
    end

    table.insert(lines, status)

    if test_case_result.trace then
        for _, line in ipairs(test_case_result.trace) do
            table.insert(lines, {
                text = '\t' .. line,
                color_group = 'TestError',
            })
        end
    end

    return lines
end

return M
