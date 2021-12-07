local v = vim

local M = {}

function M:new()
    self.highlights = {}

    return self
end

function M:save(highlight)
    table.insert(self.highlights, highlight)

    return self
end

function M:save_all(highlights)
    for _, highlight in pairs(highlights) do
        table.insert(self.highlights, highlight)
    end

    return self
end

function M:register_all()
    for _, highlight in ipairs(self.highlights) do
        self:register(highlight)
    end

    return self
end

function M:register(highlight)
    v.cmd(string.format('highlight %s', highlight))
end

return M
