local Entity = require('core.entity.entity')
local Vec2   = require('core.math.vec2')

local Mob = {}
Mob.__index = Mob

function Mob.new(x,y, target)

    local mob = setmetatable(Entity.new(x,y), Mob)

    mob.color = {r=0.8, g = 0.0, b = 0, a = 1}
    mob.scale = 5
    mob.speed = 100

    mob.target = target.position

    mob.angle = math.atan2(
        mob.target.y - mob.position.y,
        mob.target.x - mob.position.x
    )

    return mob
end

function Mob:update(dt)

    self.position.x = self.position.x + math.cos(self.angle) * self.speed * dt
    self.position.y = self.position.y + math.sin(self.angle) * self.speed * dt
end


return Mob
