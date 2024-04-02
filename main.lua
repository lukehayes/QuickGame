local Object = require('core.object')
local Entity = require('core.entity')
local Mob    = require('core.mob')

local o1 = Object:new()

local e1 = Entity:new(400,400)
local e2 = Entity:new(800,600)
local m1 = Mob:new(800,900)


--e1.color.r = 0
--e1.color.b = 1
--e1.color.g = 1

local objects = {o1, e1, e2, m1}

print(o1:get_name())
print(e1:get_name())
print(e2:get_name())
print(m1:get_name())
print("--------")
--print(o1:isType('Object'))
--print(e1:isType('Entity'))

--print("MEtatables")

--local mt = getmetatable(m1)
--print(mt)
--mt = getmetatable(mt)
--print(mt)



function love.load()
end

function love.update(dt)
    --e1.x = e1.x + 100 * dt
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


