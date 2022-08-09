local M = {}

function M.unload_package(package_name)
    for module_name, _ in pairs(package.loaded) do
        if string.find(module_name, '^' .. package_name) then
            package.loaded[module_name] = nil
        end
    end
end

function M.reload_package(package_name)
    M.unload_package(package_name)
    require(package_name)
end

return M
