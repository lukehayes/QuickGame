local R        = require('core.gfx.render')
local P        = require('core.player')
local Entity   = require('core.entity.entity')
local Sprite   = require('core.gfx.sprite')
local Assets   = require('core.assets')


s1 = Sprite.new(200,100, Assets.get_image('Pico8-Man'))
s2 = Sprite.new(200,400, Assets.get_image('Pico8-Man'))
R:add(s1)
R:add(s2)

function love.load()
    p = P.new(100,100)
end

function love.update(dt)
    P.update(p, dt)
end

function love.draw()
    love.graphics.setBackgroundColor(0.2,0.2,0.2,1)

    --R:draw_sprite(s1)
    --R:draw_sprite(s2)

    R:draw_batch()
end

function love.mousepressed(x, y, button, istouch)
end
