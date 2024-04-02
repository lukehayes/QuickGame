local Object = require('core.object')
local Entity = require('core.entity')
local Mob    = require('core.mob')

local o1 = Object:new()
local e1 = Entity:new(400,400)
local m1 = Mob:new(230,440)

e1.color.g = 1
local objects = {o1, e1, m1}

print(o1:get_name())
print(e1:get_name())
print(m1:get_name())

function love.load()
end

function love.update(dt)
    e1.x = e1.x + 100 * dt
    m1.y = m1.y + 100 * dt
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


