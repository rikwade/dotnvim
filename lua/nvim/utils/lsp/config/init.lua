local Configurer = {}

function Configurer:new()
	local o = {
		config = {},
		prevent_setup = false,
	}

	setmetatable(o, self)
	self.__index = self

	return o
end

function Configurer:get_config()
	return self.config
end

--- Returns an option in LSP config
--- @param option string name of the option
function Configurer:get_option(option)
	return self.config[option]
end

--- Sets an option in LSP config
--- @param option string name of the option
--- @param value any the value to be appended
function Configurer:set_option(option, value)
	self.config[option] = value
	return self
end

--- Prevents setup call to lspconfig
--- Some tools handle the setting up process in their plugins such as rust_tools,
--- where they expect not to call the setup() by the user. prevent_setup(true)
--- will not call the setup
--- @param should_prevent_setup boolean skip setup or not
function Configurer:set_prevent_setup(should_prevent_setup)
	self.prevent_setup = should_prevent_setup
	return self
end

--- Returns the option value if exists
--- IF the option values does not exist, default_values will be set and returned
--- @param option string name of the option
--- @param default_value any value of the option to set if not exist
function Configurer:get_option_or_default(option, default_value)
	local option_value = self.config[option]

	if not option_value then
		self.config[option] = default_value
	end

	return self.config[option]
end

--- Appends an option to list
--- @param option string name of the option
--- @param value any the value to be appended to the list in option
function Configurer:append_option(option, value)
	if not self.config[option] then
		self.config[option] = {}
	end

	table.insert(self.config[option], value)

	return self
end

return Configurer
