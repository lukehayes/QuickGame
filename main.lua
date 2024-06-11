local R      = require('core.gfx.render')
local Color  = require('core.gfx.color')
local Entity = require('game.ecs.entity.entity')
local ECS    = require('game.ecs.ecs')

require('game.ecs.system.system')

local e = ECS.new()

local t = e:add_transform(100,100,1)
e:add_transform(333,355,2)
e:add_transform(100,300,3)
e:add_transform(400,300,4)
e:add_transform(400,300,10)


function love.load()
end

function love.update(dt)
    system_move(e.components, dt)
end

function love.draw()

    R:clear(Color.BLACK)

    system_render(e.components)
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
