local R        = require('core.gfx.render')
local P        = require('core.player')
local Entity   = require('core.entity.entity')
local Sprite   = require('core.gfx.sprite')
local Assets   = require('core.assets')
local RNG      = require('core.math.random')
local AnimSprite      = require('core.gfx.animated-sprite')
local AnimationData   = require('core.gfx.animation-data')
local Color   = require('core.gfx.color')

s1 = Sprite.new(20,10, Assets.image('rock1'))
--R:add(s1)

as1 = AnimSprite.new(100,100, Assets.image('Pico8-Man'))

function love.load()
    p = P.new(100,100)
end

function love.update(dt)

    if love.keyboard.isDown('d') then

        as1:play('Walk')
        as1.flip = true
        as1.position.x = as1.position.x + as1.speed * dt

    elseif love.keyboard.isDown('a') then
        as1.position.x = as1.position.x - as1.speed * dt

        as1:play('Walk')
        as1.flip = false
    elseif love.keyboard.isDown('w') then

        as1.position.y = as1.position.y - as1.speed * dt
        as1:play('Walk')

    elseif love.keyboard.isDown('s') then
        as1.position.y = as1.position.y + as1.speed * dt

        as1.animation,
        as1.start_frame,
        as1.end_frame = as1.data:get_animation("Walk")
    else
        as1:play('Idle')
    end

    as1:update(dt)
end

function love.draw()

    R:clear(Color.BLACK)

    as1:draw()

    --R:draw_batch()
end

function love.mousepressed(x, y, button, istouch)
end
