local Object = require 'core.object'

local Entity = {}
Entity.__index = Entity

function Entity:new(x,y)

    self.name = "Entity"
    self.x = x
    self.y = y or nil

    return setmetatable(self, Object)

end

return Entity
