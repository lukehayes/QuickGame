local R      = require('core.gfx.render')
local Color  = require('core.gfx.color')
local ECS    = require('game.ecs.ecs')
local System = require('game.ecs.system.system')
local e = ECS.new()

local base_size = 1

e:add_transform(1, 400,100)
e:add_sprite(1, "spaceship-blue", 4)
e:add_collision(1, 48,48)
e:add_physics(1, 30,30)
--
--e:add_transform(2, 300,100)
--e:add_sprite(2, "debug32", 2)
--e:add_physics(2, 30,30)
--e:add_collision(2, 64,64)


--for i=1,10 do
    --local rx = love.math.random(10,500)
    --local ry = love.math.random(10,500)

   --e:add_transform(i, rx,ry)
    --e:add_sprite(i, "debug16", 2)
    --e:add_physics(i, 30,30)
    --e:add_collision(i, 64,64)
--end


function love.load()
end

function love.update(dt)
    --System.collisionWithEntities(e.components)

    if toggle then
        -- Collision and Physics order is important!
        System.collision(e.components)
        System.physics(e.components, dt)
        System.move(e.components, dt)
    end
end

function love.draw()

    R:clear(Color.BLACK)
    System.render(e.components, true)
    --System.render(e.components, false)
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
