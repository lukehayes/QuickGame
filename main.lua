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
R:add(as1)
as1.scale = 5

local data = AnimationData.new('assets/images/Pico8-Man.json')

print(data:get_size())

local anim, from, to = data:get_animation('Idle')
print(as1.from_frame)
print(as1.to_frame)


function love.load()
    p = P.new(100,100)
end

function love.update(dt)

    if love.keyboard.isDown('d') then
        as1.position.x = as1.position.x + as1.speed * dt

        as1.animation,
        as1.start_frame,
        as1.end_frame = as1.data:get_animation("Walk")
        as1.flip = true


    else
        as1.animation,
        as1.start_frame,
        as1.end_frame = as1.data:get_animation("Idle")
        as1.flip = false
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
