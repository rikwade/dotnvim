local class = require('pl.class')
local NumberUtils = require('nvim.utils.lua.number')
local CommandArguments = require('nvim.utils.lsp.command-arguments')
local GetClasspathArgumentOptions =
    require 'nvim.utils.lsp.java.options.get-classpath-argument-options'

---@diagnostic disable-next-line: undefined-global
local v = vim

local GetClasspathArguments = class(CommandArguments)

function GetClasspathArguments:_init(buffer, options)
    assert(
        not (NumberUtils.is_number(buffer)),
        'expected project_name to be a string but passed ' .. tostring(buffer))

    self:append(v.uri_from_bufnr(buffer))

    if options then
        assert(
            GetClasspathArgumentOptions:class_of(options),
            'expected options to be type GetClasspathArgumentOptions but passed ' ..
                tostring(type(options)))

        self:append_as_json(options)
    end
end
