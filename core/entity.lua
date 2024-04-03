local Object = require 'core.object'

local Entity = {}

function Entity:new(x,y)

    local instance = setmetatable({}, {__index = Object:new(x,y)})

    instance.name = "Entity"
    instance.color = {r=0, g = 0, b = 1, a = 1}

    return instance
end

return Entity
