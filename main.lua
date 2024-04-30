local R        = require('core.gfx.render')
local P        = require('core.player')
local Entity   = require('core.entity.entity')
local Sprite   = require('core.gfx.sprite')
local Assets   = require('core.assets')
local RNG      = require('core.math.random')
local AnimSprite   = require('core.gfx.animated-sprite')

s1 = Sprite.new(20,10, Assets.get_image('rock1'))
--R:add(s1)

as1 = AnimSprite.new(10,10, Assets.get_image('Pico8-Man'))
R:add(as1)


function love.load()
    p = P.new(100,100)
end

function love.update(dt)
    P.update(p, dt)

    as1:update(dt)

    if love.keyboard.isDown('s') then
        as1.position.y = as1.position.y + as1.speed * dt
        as1.playing = true
    else
        as1.playing = false
    end

    if love.keyboard.isDown('w') then
        as1.position.y = as1.position.y - as1.speed * dt
        as1.playing = true
    else
        as1.playing = false
    end

    if love.keyboard.isDown('a') then
        as1.position.x = as1.position.x - as1.speed * dt
        as1.playing = true
    else
        as1.playing = false
    end

    if love.keyboard.isDown('d') then
        as1.position.x = as1.position.x + as1.speed * dt
        as1.playing = true
    else
        as1.playing = false
    end
end

function love.draw()
    love.graphics.setBackgroundColor(0.2,0.2,0.2,1)

    as1:draw()

    --R:draw_batch()
end

function love.mousepressed(x, y, button, istouch)
end
