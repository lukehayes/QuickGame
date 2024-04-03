local Object = require 'core.object'

local Entity = {}
Entity.__index = Entity

function Entity:new(x,y)

    local instance = setmetatable({
        x = x,
        y = y
    }, {
        __index = Object
    })

    instance.name = "Entity"
    instance.color = {r=0, g = 0, b = 1, a = 1}

    return instance
end


return Entity
