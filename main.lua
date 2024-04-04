local Object = require('core.object')
local Entity = require('core.entity')
local Mob    = require('core.mob')
local Factory = require('core.object-factory')

local o1 = Factory:initObject(200,400)
local e1 = Factory:initEntity(500,100)
local e2 = Factory:initEntity(100,400)
local m1 = Factory:initMob(400,100)

Factory:add(o1)
Factory:add(e1)
Factory:add(e2)
Factory:add(m1)

mt = getmetatable(m1)

while mt do
    print(".")
    mt = getmetatable(mt)
end


function love.load()
end

function love.update(dt)
    e1.x = e1.x + 100 * dt
end

function love.draw()

    for _, e in pairs(Factory.render_list) do

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
