local class = require 'pl.class'
local Assert = require 'nvim.utils.validator.assert'
local CommandArguments = require 'nvim.utils.lsp.command-arguments'

---@diagnostic disable-next-line: undefined-global
local v = vim

local FindTestTypesAndMethodsArguments = class(CommandArguments)

function FindTestTypesAndMethodsArguments:_init(buffer)
    Assert:is_number(buffer)

    self:super({ v.uri_from_bufnr(buffer) })
end

return FindTestTypesAndMethodsArguments
