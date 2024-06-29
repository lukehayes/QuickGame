local R      = require('core.gfx.render')
local Color  = require('core.gfx.color')
local ECS    = require('core.ecs.ecs')
local System = require('core.ecs.system.system')
local Player = require('core.player')

local delta = 0

local t = 0

function love.draw()
end

function love.load()
    p = Player.new(100,100, 10)
end

function love.update(dt)
    delta = dt

    Player.update(p, dt)
end

function love.draw()

    R:clear(Color.BLACK)
    R:draw(p)
    Player.show_velocity(p)

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
