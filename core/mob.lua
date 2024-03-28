local Entity = require('core.entity')

local Mob = Entity:new()

function Mob:new()
    local instance = {}

    --instance.__index = instance
    instance.name = 'Mob'

    setmetatable(instance, Mob)

    return instance
end

return Mob

