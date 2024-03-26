local Object = require('core.class')

o1 = Object:new()
o1.name = 'BOB'

o2 = o1:new()

print(o1.name, o2.name)


function love.load()
end

function love.update(dt)
end

function love.draw()
end


