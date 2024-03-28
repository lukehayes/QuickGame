local Object = {
    name  = "Object",
    x     = 10,
    y     = 10,
    scale = 40,
    color = {r=1, g = 0, b = 1, a = 1}
}

Object.__index = Object -- This is needed for inheritance to work!.

Object.__call = function()
    print("Functor")
end

function Object:new()
    local instance = {}
    return setmetatable(instance, self)
end


function Object:get_name()
    return self.name
end

return Object
