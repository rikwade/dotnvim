local class = require 'pl.class'
local CommandArguments = require 'nvim.utils.lsp.command-arguments'
local NumberUtil = require 'nvim.utils.lua.number'

---@diagnostic disable-next-line: undefined-global
local v = vim

local FindTestTypesAndMethodsArguments = class(CommandArguments)

function FindTestTypesAndMethodsArguments:_init(buffer)
    assert(
        NumberUtil.is_number(buffer),
        'expected buffer to be a number but passed ' .. tostring(buffer))

    self:super({ v.uri_from_bufnr(buffer) })
end

return FindTestTypesAndMethodsArguments
