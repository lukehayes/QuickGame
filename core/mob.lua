local Entity = require('core.entity')

local Mob = {}
Mob.__index = Mob

function Mob:new(x,y)

    local instance = setmetatable(self, {__index = Entity:new(x,y)})

    self.name    = 'Mob'
    self.color.r = 0
    self.color.g = 1
    self.color.b = 0
    self.scale = 100

    print(self.x, self.y)

    return instance
end

return Mob

