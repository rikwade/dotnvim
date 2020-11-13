local Variable = require('vim.variable')

local VariableType = Variable.VariableType
local add_variables = Variable.add_variables

local global_variables = {
    mapleader = " "
}

-- adding variables
add_variables(VariableType.GLOBAL_VARIABLE, global_variables);