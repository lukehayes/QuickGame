local Object = require('core.object')
local Entity = require('core.entity')
local Mob    = require('core.mob')


local e1 = Entity:new(100,100)
local m1 = Mob:new(300,200)
local m2 = Mob:new(300)

local objects = {e1, m1,m2}

Object.check_type('Entity', e1)
Object.check_type('Mob', m1)


function love.load()
end

function love.update(dt)
    e1.x = e1.x + 100 * dt
    m1.x = m1.x + 40 * dt
    m2.x = m2.x + 80 * dt
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
