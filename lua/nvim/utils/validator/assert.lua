local List = require('pl.List')
local StringAssert = require('nvim.utils.validator.string_assert')
local NumberAssert = require('nvim.utils.validator.number_assert')

local Assert = {}

function Assert.get_message(message)
    return message .. '\n' .. debug.traceback()
end

function Assert.is_string(value, message)
    message = Assert.get_message(
        message or ('expected value to be a string but passed ' .. type(value))
    )

    assert(type(value) == 'string', message)

    return StringAssert:new(value)
end

function Assert.is_number(value, message)
    message = Assert.get_message(
        message or ('expected value to be a number but passed ' .. type(value))
    )
    assert(type(value) == 'number', message)

    return NumberAssert:new(value)
end

function Assert.is_function(value, message)
    message = Assert.get_message(
        message
            or ('expected value to be a function but passed ' .. type(value))
    )
    assert(type(value) == 'function', message)
end

function Assert.is_boolean(value, message)
    message = Assert.get_message(
        message or ('expected value to be a boolean but passed ' .. type(value))
    )
    assert(type(value) == 'boolean', message)
end

function Assert.is_table(value, message)
    message = Assert.get_message(
        message or ('expected value to be a table but passed ' .. type(value))
    )
    assert(type(value) == 'table', message)
end

function Assert.is_nil(value, message)
    message = Assert.get_message(
        message or ('expected value to be a nil but passed ' .. type(value))
    )
    assert(type(value) == 'nil', message)
end

function Assert.is_true(value, message)
    message = Assert.get_message(
        message
            or ('expected value to be a true but passed ' .. tostring(value))
    )
    assert(value == true, message)
end

function Assert.is_false(value, message)
    message = Assert.get_message(
        message
            or ('expected value to be a false but passed ' .. tostring(value))
    )
    assert(value == false, message)
end

function Assert.is_truthy(value, message)
    message = Assert.get_message(
        message
            or ('expected value to be a truthy but passed ' .. tostring(value))
    )
    assert(value, message)
end

function Assert.is_falsy(value, message)
    message = Assert.get_message(
        message
            or ('expected value to be a falsy but passed ' .. tostring(value))
    )
    assert(not value, message)
end

function Assert.is_instance_of(cls, value, message, class_name)
    message = class_name
        and Assert.get_message(
            ('expected value to be an instance of ' .. class_name)
                or 'expected value to be an instance of the passed class'
        )
    assert(getmetatable(value) == cls, message)
end

function Assert.is_not_instance_of(cls, value, message, class_name)
    message = class_name
        and Assert.get_message(
            ('expected value not to be an instance of ' + class_name)
                or 'expected value not to be an instance of the passed class'
        )
    assert(not (getmetatable(value) == cls), message)
end

function Assert.is_primitive(value, message)
    message = Assert.get_message(
        message or ('expected value to a primitive but passed ' .. type(value))
    )

    local allowed_types = List({ 'number', 'string', 'boolean' })
    assert(allowed_types:contains(type(value)), message)
end

function Assert.is_instance_of_any(classes, value, message, class_name)
    local matching_classes = List(classes):filter(function(cls)
        return getmetatable(value) == cls
    end)

    local has_any = matching_classes:len() > 0

    message = class_name
        and Assert.get_message(
            ('expected value to be an instance of ' .. class_name)
                or 'expected value to be an instance of the passed class'
        )

    assert(has_any, message)
end

return Assert
