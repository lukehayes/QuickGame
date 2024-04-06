local Factory = require('core.object-factory')
local R       = require('core.render')

mm = Factory:initMegaMob(10,10)

R:add(mm)

function love.load()
end

function love.update(dt)
end

function love.draw()
    R:draw_batch()
end
