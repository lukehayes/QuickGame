local R      = require('core.gfx.render')
local Color  = require('core.gfx.color')
local ECS    = require('game.ecs.ecs')
local System = require('game.ecs.system.system')

local e = ECS.new()

local base_size = 1

e:add_transform(1, 100,100)
e:add_sprite(1, "debug32")
e:add_collision(1, 16,16)

e:add_transform(2, 300,400)
e:add_sprite(2, "debug16")
e:add_collision(2,32,32)

function love.load()
end

function love.update(dt)
    System.collision(e.components)
    --System.move(e.components, dt)
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
   end
end
