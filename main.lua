local R        = require('core.gfx.render')
local Color   = require('core.gfx.color')
local Entity  = require('core.entity.entity')
local AnimSprite  = require('core.gfx.animated-sprite')
local StateEntity  = require('core.entity.state_entity')
local Timer  = require('core.math.timer')

local e1 = Entity.new(300,300)
e1.color = {r=1, g = 0.8, b = 1, a = 1}
e1.speed = 300

local e2 = Entity.new(100,500)
e2.color = {r=1, g = 0.8, b = 1, a = 1}

local e3 = Entity.new(600,500)

local s1 = AnimSprite.new(100,100, 'assets/images/Pico8-Man.png', 0.2, 'Idle')
s1.scale = 10

local s2 = StateEntity.new(400,100, 'assets/images/Pico8-Man.png', 0.2, 'Idle')
s2.scale = 7

t1 = Timer.new(1,true)

function love.load()
end

function love.update(dt)
    e1:update(dt)
    e2:update(dt)

    s1:update(dt)
    s2:update(dt)

    t1:update(dt)

    if t1.finished then
        print(">>>>>>>>>>>>>>>>>>>>>>")
        s1.position.x = love.math.random(10,400)
        s1.position.y = love.math.random(10,400)
    end

end

function love.draw()

    R:clear(Color.BLACK)

    --R:draw(e1)
    --R:draw(e2)
    --R:draw(e3)

    s1:draw()
    s2:draw()
end

function love.mousepressed(x, y, button, istouch)
end
