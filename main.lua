local R       = require('core.render')
local P       = require('core.player')
local Game    = require('core.game')

function love.load()
    p = P.new(100,100)
end

function love.update(dt)
    P.update(p, dt)
end

function love.draw()
    --R:draw_batch()
    R:draw_sprite(p)
end


function love.mousepressed(x, y, button, istouch)
end
