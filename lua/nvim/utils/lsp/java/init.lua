local lsp_util = R 'nvim.utils.lsp'

local M = {}

local function execute_command(command, callback)
    if type(command) == 'string' then command = { command = command } end

    lsp_util.execute_command(
        { command }, function(err, res)
            assert(not err, err and (err.message or Log.ins(err)))
            callback(res)
        end
    )
end

--[[
-- Starts the dubug session and returns the port
--
-- @Param callback {function(port: number)}
--]]
function M.start_debug_session(callback)
    execute_command('vscode.java.startDebugSession', callback)
end

--[[
-- Returns all the main classes in the project
--
-- @Param callback {function(main_classes: List)}
--]]
function M.resolve_main_classes(callback)
    execute_command('vscode.java.resolveMainClass', callback)
end

--[[
-- Returns classpath for the given main class
--
-- @Param main_class {string} of which classpath should be returned
-- @Param callback {function(class_path: string)}
--]]
function M.resolve_classpath(main_class, callback)
    execute_command(
        {
            command = 'vscode.java.resolveClasspath',
            arguments = { main_class, main_class },
        }, callback
    )
end

--[[
-- Returns list of main class and classpath map
--
-- @Param callback {function(classpaths: List)}
--]]
function M.resolve_class_paths(callback)
    local classpaths = {}

    local function resolve_all_classpaths(class_iter)
        local main_class = class_iter.next()

        if not main_class then return callback(classpaths) end

        M.resolve_classpath(
            main_class, function(classpath)
                table.insert(
                    classpaths,
                    { main_class = main_class, classpath = classpath }
                )

                resolve_all_classpaths(class_iter)
            end
        )
    end

    M.resolve_main_classes(
        function(main_classes)
            local index = 1

            local main_class_iter = {
                next = function()
                    local temp_index = index
                    index = index + 1
                    return main_classes[temp_index]
                end,
            }

            resolve_all_classpaths(main_class_iter)
        end
    )
end

return M
