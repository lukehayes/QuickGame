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

local down = false
local toggled = false

function love.load()
   p = P.new(100,100)
end

function love.update(dt)

    as1.anim_changed = false
    as1:update(dt)

    if down == true and toggled ~= true then
        --print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
        toggled = true
        as1.anim_changed = true
    end
    
    if down == false and toggled == true then
        toggled = false
        as1.anim_changed = false
    end

    if love.keyboard.isDown('d') then

        as1:play('Walk')
        as1.flip = true
        as1.position.x = as1.position.x + as1.speed * dt
        down = true

    elseif love.keyboard.isDown('a') then

        as1:play('Walk')
        as1.flip = false
        as1.position.x = as1.position.x - as1.speed * dt
        down = true

    elseif love.keyboard.isDown('w') then

        as1:play('Walk')
        as1.position.y = as1.position.y - as1.speed * dt
        down = true

    elseif love.keyboard.isDown('s') then

        as1:play('Walk')
        as1.position.y = as1.position.y + as1.speed * dt
        down = true

    else
        as1:play('Idle')
        down = false
    end

end

function love.draw()

    R:clear(Color.BLACK)

    as1:draw()
    --R:draw_batch()
end

function love.mousepressed(x, y, button, istouch)
end
