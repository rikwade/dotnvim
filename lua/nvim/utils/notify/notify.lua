local notify = require('notify')
local class = require 'pl.class'
local ModelValidator = require 'nvim.utils.validator.model'
local StringSchemeValidator =
    require 'nvim.utils.validator.model.scheme.string-scheme'
local NumberSchemeValidator =
    require 'nvim.utils.validator.model.scheme.number-scheme'
local FunctionSchemeValidator =
    require 'nvim.utils.validator.model.scheme.function-scheme'
local BooleanSchemeValidator =
    require 'nvim.utils.validator.model.scheme.boolean-scheme'

local config_validator = ModelValidator(
                             {
        title = StringSchemeValidator(),
        icon = StringSchemeValidator({ max = 1, min = 1 }),
        timeout = NumberSchemeValidator(),
        keep = BooleanSchemeValidator(),
        on_open = FunctionSchemeValidator(),
        on_close = FunctionSchemeValidator(),
    })

local Notify = class()

function Notify:_init(config)
    config_validator:validate(config)
    self.config = config
end

function Notify.notify(self, message, type)
    notify(message, type, self.config)
end

function Notify.success(self, message)
    self:notify(message, 'SUCCESS')
end

function Notify.error(self, message)
    self:notify(message, 'ERROR')
end

function Notify.warn(self, message)
    self:notify(message, 'WARN')
end

function Notify.info(self, message)
    self:notify(message, 'INFO')
end

function Notify.debug(self, message)
    self:notify(message, 'DEBUG')
end

function Notify.trace(self, message)
    self:notify(message, 'TRACE')
end

return Notify
