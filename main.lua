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
e1.color = {r=0.1, g = 0.8, b = 0, a = 1}

local e2 = Entity.new(100,500)

print(e1.name)
print(e2.name)
print(e1.position)
print(e2.position)

function love.load()
end

function love.update(dt)
    e1:update(dt)
    e2:update(dt)
end

function love.draw()

    R:clear(Color.BLACK)

    R:draw(e1)
    R:draw(e2)

end

function love.mousepressed(x, y, button, istouch)
end
