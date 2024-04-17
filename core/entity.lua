local Factory = require('core.object-factory')

local Entity = {}
Entity.__index = Entity

function Entity.new(x,y)

    local obj = {}

    obj.name  = "Entity"
    obj.color = {r=1, g = 0, b = 0, a = 1}

    return setmetatable(obj, {__index = Factory:initObject(x,y)})
end

function Entity:update(dt)
    print("Entity update")
end


return Entity
