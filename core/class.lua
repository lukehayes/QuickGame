local Object = {
    name = "Object",
    x = 10,
    y = 10
}

Object.__index = Object

function has_index(obj)
    return obj:find('__index')
end

function Object:new()

    local instance = {}

    --for k,v in pairs(self) do

        --if has_index(k) then
            --print("instance[".. k .. "]" .. " = ", v)
            --instance[k] = v
        --end
    --end

    -- Line below avoids the need to define Object.__index = function() end ...
    -- line commented out above.
    instance.__index = Object
    instance.super = self
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

return Object
