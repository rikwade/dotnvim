local M = {}

function M:new(num)
    local o = {
        value = num,
    }

    setmetatable(o, self)
    self.__index = self
    return o
end

function M:greater_than(num)
    assert(self.value > num)
    return self
end

function M:less_than(num)
    assert(self.value < num)
    return self
end

function M:greater_than_or_equal(num)
    assert(self.value >= num)
    return self
end

function M:less_than_or_equal(num)
    assert(self.value <= num)
    return self
end

function M:positive(num)
    assert(self.value > 0)
    return self
end

function M:negative()
    assert(self.value < 0)
    return self
end

return M
