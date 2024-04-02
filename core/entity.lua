local Object = require 'core.object'

local Entity = {}
Entity.__index = Entity

function Entity:new(x,y)

    local instance = setmetatable({}, Object:new(x,y))

    print("Metatable check", mt, getmetatable(instance))

    instance.name = "Entity"

    return instance
end

return Entity
