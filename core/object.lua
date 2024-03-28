local Object = {
    name = "Object",
    x = 10,
    y = 10,
    scale = 40,
    color = {r=1, g = 0, b = 1, a = 1}
}

Object.__index = Object -- This is needed for inheritance to work!.

function Object:new()
    return self
end

return Object
