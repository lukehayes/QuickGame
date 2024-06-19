local R      = require('core.gfx.render')
local Color  = require('core.gfx.color')
local ECS    = require('game.ecs.ecs')
local System = require('game.ecs.system.system')
local e = ECS.new()

local base_size = 1

e:add_transform(1, 400,100)
e:add_sprite(1, "debug16", 2)
e:add_collision(1, 48,48)
e:add_physics(1, 30,30)

e:add_transform(2, 100,100)
e:add_sprite(2, "debug32", 2)
e:add_collision(2, 100,100)
e:add_physics(2, 10,130)

e:add_transform(3, 500,400)
e:add_sprite(3, "debug32")
e:add_collision(3,32,32)
e:add_physics(3, 3,3)

e:add_transform(4, 200,500)
e:add_sprite(4, "debug32")
e:add_collision(4,32,32)
e:add_physics(4, 1,1)

for i=1,10 do
    local rx = love.math.random(10,600)
    local ry = love.math.random(10,600)

    e:add_transform(i, rx,ry)
    e:add_sprite(i, "debug32")
    e:add_collision(i,32,32)
    e:add_physics(i, 1,1)
end

function love.load()
end

function love.update(dt)
    System.collision(e.components)
    --System.collisionWithEntities(e.components)

    if toggle then
        --System.move(e.components, dt)
        System.physics(e.components, dt)
    end
end

function love.draw()

    R:clear(Color.BLACK)
    --System.render(e.components, true)
    System.render(e.components, false)
end

function love.mousepressed(x, y, button, istouch)
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
