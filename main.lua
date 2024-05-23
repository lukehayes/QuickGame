local R        = require('core.gfx.render')
local Color   = require('core.gfx.color')
local Entity  = require('core.entity.entity')

--local StateEntity   = require('core.entity.state_entity')
--local as1 = AnimSprite.new(100,100, Assets.image('Pico8-Man'))
--local down = false
--local toggled = false
--local stateEntity = StateEntity.new(300,300, Assets.image('Pico8-Man'))
--as1 = stateEntity


local e1 = Entity.new(300,300)
local e2 = Entity.new(100,400)
e2.color = {r=0.1, g = 0.9, b = 1, a = 1}

local e3 = Entity.new(300,100)
e3.color = {r=0.1, g = 0.9, b = 0.2, a = 1}

function love.load()
end

e1:hello()
e2:hello()
e3:hello()

function love.update(dt)
    e1:update(dt)
    e2:update(dt)
    e3:update(dt)
end

function love.draw()

    R:clear(Color.BLACK)

    R:draw(e1)
    R:draw(e2)
    R:draw(e3)

end

function love.mousepressed(x, y, button, istouch)
end
