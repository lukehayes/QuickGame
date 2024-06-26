local Entity = require('core.entity.entity')
local Vec2   = require('core.math.vec2')

local Bullet = {}
Bullet.__index = Bullet

function Bullet.new(x,y, target)
    local bullet = setmetatable(Entity.new(x,y), Bullet)

    bullet.color = {r=0.8, g = 0.0, b = 0, a = 1}
    bullet.scale = 5
    bullet.speed = 100

    local mx,my = love.mouse.getPosition()
    bullet.target = Vec2:new(mx,my)

    bullet.angle = math.atan2(
        bullet.target.y - bullet.position.y,
        bullet.target.x - bullet.position.x
    )

    return bullet
end

function Bullet:update(dt)

    self.position.x = self.position.x + math.cos(self.angle) * self.speed * dt
    self.position.y = self.position.y + math.sin(self.angle) * self.speed * dt
end


return Bullet
