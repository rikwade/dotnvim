local v = vim

local M = {}

function M:new()
    self.highlight_groups_list = {}

    return self
end

function M:add(highlight_groups)
    table.insert(self.highlight_groups_list, highlight_groups)

    return self
end

function M:register_highlights()
    for _, highlight_groups in ipairs(self.highlight_groups_list) do
        for _, highlight_group in pairs(highlight_groups) do
            v.cmd(
                string.format(
                    'highlight %s %s',
                    highlight_group.name,
                    highlight_group.colors
                )
            )
        end
    end

    return self
end

return M
