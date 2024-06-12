local R      = require('core.gfx.render')
local Color  = require('core.gfx.color')
local ECS    = require('game.ecs.ecs')
local System = require('game.ecs.system.system')

local e = ECS.new()

local t = e:add_transform(1, 100,100)
e:add_collision(1)

e:add_transform(2, 300,340)
e:add_collision(2)

for i=1,10 do
    local rx = love.math.random(10,1200)
    local ry = love.math.random(10, 720)
    local rc = love.math.random(1,100)

    e:add_transform(i, rx,ry)

    if rc > 50 then
        e:add_collision(i)
    end

end

function love.load()
end

function love.update(dt)
    System.collision(e.components)
    System.move(e.components, dt)
end

function love.draw()

    R:clear(Color.BLACK)
    System.render(e.components, true)
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
