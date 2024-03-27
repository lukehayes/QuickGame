local Object = require 'core.object'

local Entity = {}
Entity.__index = Entity

function Entity:new()
    local instance = {}

    instance.x = 300
    instance.color = { r=0, g = 1, b = 0, a = 1 }

    setmetatable(instance, Object:new() )
    instance.__index = self

    return instance
end

return Entity
