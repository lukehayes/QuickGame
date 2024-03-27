local Object = {
    name = "Object",
    x = 10,
    y = 10,
    scale = 40,
    color = {r=1, g = 0, b = 1, a = 1}
}

Object.__index = Object

-- Check if an object has an '__index' metamethod.
-- obj must be a string. To be used in a for...pairs
function has_index(obj)
    return obj:find('__index')
end

function Object:new()

    local instance = {}

    -- Line below avoids the need to define Object.__index = function() end ...
    -- line commented out above.
    -- instance.__index = Object
    instance.super   = self
    setmetatable(instance, self)

    return instance

end

function Object:extends(child)

    local t = setmetatable( child, {
        __index = self
    })

    --t.__index = self

    return t
end

function Object:get_name()
    return "Name: " .. self.name
end

--function Object:newExtra()
    --local instance = {}
    --for k,v in pairs(self) do

        --if has_index(k) then
            --print("instance[".. k .. "]" .. " = ", v)
            --instance[k] = v
        --end
    --end

    -- Line below avoids the need to define Object.__index = function() end ...
    -- line commented out above.
    --instance.__index = Object
    --instance.super   = self
    --setmetatable(instance, self)
    --return instance
--end

return Object
