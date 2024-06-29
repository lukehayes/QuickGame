local R      = require('core.gfx.render')
local Color  = require('core.gfx.color')
local ECS    = require('core.ecs.ecs')
local System = require('core.ecs.system.system')

local delta = 0

function love.load()
end

function love.update(dt)
    delta = dt
end

function love.draw()

    R:clear(Color.BLACK)
    -- ECS
    --System.render(e.components, true)
    --System.render(e.components, false)
end

function love.mousepressed(x, y, button, istouch)
end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end

   --if key == "space" then
       --print("Space")
        --toggle = not toggle
   --end
end
