local Object = require('core.object')
local Entity = require('core.entity')
local Mob    = require('core.mob')
local Factory = require('core.object-factory')

local o1 = Factory:initObject(10,400)
local e1 = Factory:initEntity(200,400)

print("Object", o1.x, o1.y)
print("Entity", e1.x, e1.y)

Factory:add(o1)
Factory:add(e1)

mt = getmetatable(mm)
c = 0

while mt do
    c = c + 1
    print("Checking mt", c)
    print(c)
    mt = getmetatable(mt)
end


function love.load()
end

function love.update(dt)
    --e1.x = e1.x + 100 * dt
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
