local M = {}

function M.count(list)
    local count = 0

    for _, _ in ipairs(list) do
        count = count + 1
    end

    return count
end

function M.concat(...)
    local args = {...}

    if V.tbl_count(args) == 0 then
        error('No values passed')
    end


    if V.tbl_count(args) < 2 then
        error('Passed only one parameter')
    end

    local first = args[1]
    table.remove(args, 1)

    for _, tbl in ipairs(args) do
        for _, value in ipairs(tbl) do
            table.insert(first, value)
        end
    end

    return first
end

return M
