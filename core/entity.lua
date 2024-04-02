local Object = require 'core.object'

local Entity = { name = "Entity" }
Entity.__index = Entity

function Entity:new(x,y)
    local instance = setmetatable({}, { __index = Object:new(x,y) })

    --instance.__index = instance
    
    return instance
end

return Entity
