local Entity = require('core.entity')

local Mob = {}
Mob.__index = Mob


function Mob:new(x,y)

    local instance = setmetatable({}, Entity:new(x,y))

    instance.name    = 'Mob'
    instance.color.r = 0
    instance.color.g = 1
    instance.color.b = 0

    return instance
end

return Mob

