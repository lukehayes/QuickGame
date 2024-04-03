local Object = require('core.object')
local Entity = require('core.entity')
local Mob    = require('core.mob')


--o1 = Object:new(300,300)
--o2 = Object:new(100,300)
e1 = Entity:new(30,300)
e2 = Entity:new(400,600)

print(e1)
print(e2)

--local objects = {o1, o2, e1, e2}
local objects = {e1, e2}

--o2.color.r = 0
--e2.color.r = 0


--print(o1:get_name())
--print(o2:get_name())
print(e1:get_name())
print(e2:get_name())

function love.load()
end

function love.update(dt)
    e1.x = e1.x + 100 * dt
    e2.x = e2.x + 50 * dt
    --m1.y = m1.y + 100 * dt
end

function love.draw()

    for _, e in pairs(objects) do

        love.graphics.setColor(
            e.color.r,
            e.color.g,
            e.color.b,
            e.color.a
        )

        love.graphics.rectangle(
            'fill',
            e.x,
            e.y,
            e.scale,
            e.scale
        )

        love.graphics.setColor(1,1,1,1)
    end
end


