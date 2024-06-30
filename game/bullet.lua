local Entity = require('core.entity.entity')
local Vec2   = require('core.math.vec2')

local Bullet = {}
Bullet.__index = Bullet

function Bullet.new(x,y, target)
    local bullet = setmetatable(Entity.new(x,y), Bullet)

    bullet.color = {r=0.8, g = 0.0, b = 0, a = 1}
    bullet.scale = 5
    bullet.speed = 500

    local mx,my = love.mouse.getPosition()
    bullet.target = Vec2:new(x,y)

    return bullet
end

function Bullet:update(dt)
    local angle = math.atan2(
        self.target.y - self.position.y,
        self.target.x - self.position.x
    )

    print("Angle", angle)

    self.position.x = self.position.x + math.cos(angle) * self.speed * dt
    self.position.y = self.position.y + math.sin(angle) * self.speed * dt
end


return Bullet
