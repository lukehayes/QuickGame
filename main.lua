local R      = require('core.gfx.render')
local Color  = require('core.gfx.color')
local ECS    = require('game.ecs.ecs')
local System = require('game.ecs.system.system')

local e = ECS.new()

local base_size = 1

e:add_transform(1, 400,100)
e:add_sprite(1, "debug16",1)
e:add_collision(1, 64,64)


--for i=1,100 do
    --local rx = love.math.random(10,600)
    --local ry = love.math.random(10,600)
    --local rs = love.math.random(8,64)

    --e:add_transform(i, rx,ry)
    --e:add_sprite(i, "debug16")
    --e:add_collision(i, rs,rs)
--end

--e:add_transform(2, 200,400)
--e:add_sprite(2, "debug32")
--e:add_collision(2, 128,128)

--e:add_transform(3, 400,600)
--e:add_sprite(3, "debug16")
--e:add_collision(3, 64,64)


function love.load()
end

function love.update(dt)
    System.collision(e.components)

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
