local Entity = require('core.entity')

local Mob = {}

function Mob:new()

    local instance   = setmetatable(self, { __index = Entity:new(x,y) })
    instance.name    = 'Mob'

    return instance
end

return Mob

