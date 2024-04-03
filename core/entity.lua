local Object = require 'core.object'

local Entity = {}
Entity.__index = Entity

function Entity:new(x,y)

    local instance = {}

    instance.name = "Entity"
    instance.color = {r=0, g = 0, b = 1, a = 1}

    setmetatable(instance, {__index = Object:new(x,y)})
    --setmetatable(instance, Object:new(x,y))
    self.__index = self

    return instance
end

return Entity
