
local Object = {
    x = 10,
    y = 10,
    name = "Object"
}

function Object:new()
    print("Self:", self)
    return setmetatable({}, { __index = Object })
end

function Object:extend(child)
    print("Extend: ", self)
    return setmetatable(child, {__index = self})
end

function Object:hello()
    print("Hello from", self)
end



local Entity = {}
function Entity:new()

    local entity = {
        name = "Entity"
    }

    return setmetatable(entity, {__index = Object})
end

o1 = Object:new()
o2 = Object:new()
e1 = {}
e1 = Object:extend(Entity:new())

print(e1.name)


--print(o1)
--print(o2)
--print(o1.name, o2.name)
--print(o1.x, o1.y)
--print(o2.x, o2.y)
