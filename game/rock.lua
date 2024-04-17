local Entity  = require('core.entity')

local Rock = {}
Rock.__index = Rock

function Rock.new(x,y)

    local obj = setmetatable({}, {__index = Entity.new(x,y)})
    obj.name  = "Rock"
    obj.color = {r=0, g = 1, b = 1, a = 1}
    obj.speed = 100
    obj.scale = love.math.random(0.5, 2)
    obj.sprite = love.graphics.newImage('assets/rock1.png')
    obj.sprite:setFilter('nearest', 'nearest')

    obj.dx = love.math.random(-1,1)
    obj.dy = love.math.random(-1,1)

    return obj
end

function Rock.update(r, dt)
    r.position.x = r.position.x + r.dx +  r.speed * dt
    r.position.y = r.position.y + r.dy +  r.speed * dt
end

return Rock
