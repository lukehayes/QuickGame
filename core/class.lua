local class = {
    name = "class",
    x = 10,
    y = 10
}

--class.__index = function(k,v)
    --print('class __index searched')
    --return class[v]
--end


function tostring(class)
    return "Instance of " .. class
end

function class.new()
    local obj = {}

    setmetatable(obj, class)

    -- Line below avoids the need to define class.__index = function() end ...
    -- line commented out above.
    class.__index = class
    return obj
end

function class:extends(child)

    local t = setmetatable( child, {
        __index = self,
        __tostring = tostring(child.name),
    })

    --t.__index = self

    return t
end

return class
