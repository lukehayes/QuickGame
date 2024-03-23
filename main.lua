

local r = require('core.render')
local m = require('core.mob')
require('core.player')

p =  player_init(300,200, 40)
m1 = mob_create(200,400, 70)
m2 = mob_create(400,200, 80)
b = mob_create(10,10, 10)
b.speed = 300

function love.load()
end

function love.update(dt)

    player_update(p, dt)

    b.x = b.x + b.dx * b.speed * dt
    b.y = b.y + b.dy * b.speed * dt

    if b.x < 0 or b.x > 500 then
        b.dx = -b.dx
    end

    if b.y < 0 or b.y > 500 then
        b.dy = -b.dy
    end

end

function love.draw()
   draw(p)
   draw(m1)
   draw(m2)
   draw(b)
end


