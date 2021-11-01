local class = require('pl.class')
local StringUtils = require('nvim.utils.lua.string')
local CommandArguments = require('nvim.utils.lsp.command-arguments')

local ResolveClasspathArguments = class(CommandArguments)

function ResolveClasspathArguments:_init(project_name, class_name)
    assert(
        StringUtils.is_string(project_name),
        'expected project_name to be a string but passed ' ..
            tostring(project_name))

    assert(
        not (StringUtils.is_empty(project_name)),
        'expected project_name to be valid but passed empty value')

    assert(
        StringUtils.is_string(class_name),
        'expected class_name to be a string but passed ' ..
            tostring(project_name))

    assert(
        not (StringUtils.is_empty(class_name)),
        'expected class_name to be valid but passed empty value')

    self:super({ class_name, project_name })
end

return ResolveClasspathArguments
