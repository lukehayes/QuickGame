local r = require('core.render')
local m = require('core.mob')
local class = require('core.class')

require('core.player')

local t = {
    color = {r = 0.5, g = 0.0, b = 0.5, a = 0.5}
}


--p  =  player_init(300,200, 40)
--m1 = mob_create(200,400, 70)
--m2 = mob_create(400,200, 80)
--b  = mob_create(10,10, 100)
--b.speed = 300


--setmetatable( p,  {__index = t} )
--setmetatable( m1, {__index = t} )
--setmetatable( m2, {__index = t} )
--setmetatable( b,  {__index = function(a,b)
    --print(a,b)
--end} )


o = class.new()
foo = class:extends(o)
foo.name = "Foo Class"


print(o.name)
print(foo.name)






function love.load()
end

function love.update(dt)

    --player_update(p, dt)

    --b.x = b.x + b.dx * b.speed * dt
    --b.y = b.y + b.dy * b.speed * dt

    --if b.x < 0 or b.x > 500 then
        --b.dx = -b.dx
    --end

    --if b.y < 0 or b.y > 500 then
        --b.dy = -b.dy
    --end

end

function love.draw()
   --draw(p)
   --draw(m1)
   --draw(m2)
   --draw(b)
end


