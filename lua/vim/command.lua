local Types = require('common.types')
local Command = {}

-- run list of commands
--
-- @param commands table of commands to run
function Command:run_commands(commands)
	if Types:is_table(commands) == false then
		error('add_commands expected type "table"')
	end

	for _, value in ipairs(commands) do
		vim.cmd(value)
	end
end

return Command
