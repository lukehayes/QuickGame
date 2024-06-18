local R      = require('core.gfx.render')
local Color  = require('core.gfx.color')
local ECS    = require('game.ecs.ecs')
local System = require('game.ecs.system.system')

local e = ECS.new()

local base_size = 1

e:add_transform(1, 400,100)
e:add_sprite(1, "debug16", 2)
e:add_collision(1, 48,48)

e:add_transform(2, 100,100)
e:add_sprite(2, "debug32", 2)
e:add_collision(2, 100,100)

e:add_transform(3, 500,400)
e:add_sprite(3, "debug32")
e:add_collision(3,32,32)

c = 4

function love.load()
end

function love.update(dt)
    System.collision(e.components)
    System.collisionWithEntities(e.components)

    if toggle then
        System.move(e.components, dt)
    end
end

function love.draw()

    R:clear(Color.BLACK)
    System.render(e.components, true)
    --System.render(e.components, false)
end

function love.mousepressed(x, y, button, istouch)

    local rs = love.math.random(16,64)
    local s = {"debug32", "debug16"}

    e:add_transform(c, x,y)
    e:add_sprite(c, s[love.math.random(1,2)])
    e:add_collision(c,rs,rs)

    c = c + 1
end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end

   if key == "space" then
       print("Space")
        toggle = not toggle
   end
end
