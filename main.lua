local R      = require('core.gfx.render')
local Color  = require('core.gfx.color')
local Game = require('game.game')
local DebugLevel = require('game.levels.debug-level')

local dblv = DebugLevel.new()

function love.draw()
end

function love.load()
    love.mouse.setCursor(Game.cursor)
end

function love.update(dt)
    Game.delta = dt

    dblv:update(dt)
end

function love.draw()

    --R:clear(Color.BLACK)
    dblv:render()

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

   if key == "p" then
       Game.player_fire_rate = 0.1
   end

   --if key == "space" then
       --print("Space")
        --toggle = not toggle
   --end
end
