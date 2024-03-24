local class = {
    name = "classs"
}

class.__index = function(k,v)
    return class[v]
end


function class.new()
    local obj = {}
    setmetatable(obj, class)
    return obj
end


function class:extends(child)
    setmetatable( child,  { __index = self })
    return self
end


return class
