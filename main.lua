local Object = require('core.object')
local Entity = require('core.entity')
local Mob    = require('core.mob')
local Factory = require('core.object-factory')

local o1 = Factory:initMegaMob(10,400)

o1.color.r = 1



local o2 = Factory:initMegaMob(200,400)
--local o1 = Factory:initMegaMob(200,400)

print(o1.name, o1.x, o1.y)
print(o2.name, o2.x, o2.y)
--print("Entity", e1.x, e1.y)

Factory:add(o1)
Factory:add(o2)
--Factory:add(e1)

mt = getmetatable(o1)
c = 0

while mt do
    c = c + 1
    print(c)
    mt = getmetatable(mt)
end


function love.load()
end

function love.update(dt)
    o1.x = o1.x + 100 * dt
    o2.y = o2.y - 100 * dt
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
