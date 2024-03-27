local Object = require('core.object')
local Entity = require('core.entity')

o1 = Object:new()
o1.name = 'BOB'
o2 = o1:new()

e1 = Entity:new(Object)
e2 = Entity:new(Object)
e2.y = 300

local objects = {o1, e1, e2}

print(o1:get_name())
print(e1:get_name())

function love.load()
end

function love.update(dt)
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


