local R        = require('core.gfx.render')
local Color   = require('core.gfx.color')

function love.load()
end

function love.update(dt)
end

function love.draw()

    R:clear(Color.BLACK)
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
