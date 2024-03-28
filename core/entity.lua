local Object = require 'core.object'

local Entity = {}
Entity.__index = Entity

function Entity:new(x,y)

    local instance = {}

    instance.name = "Entity"
    instance.x    = x
    instance.y    = y or nil

    instance.__index = instance

    setmetatable( instance, Object )

    return instance

end

return Entity
