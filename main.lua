local R      = require('core.gfx.render')
local Color  = require('core.gfx.color')
local ECS    = require('game.ecs.ecs')
local System = require('game.ecs.system.system')
local e = ECS.new()
local delta = 0

function change_color(t)
    t.position.x = love.math.random(10,600)
    t.position.y = love.math.random(10,600)
    t.color.r    = love.math.random(0.2,1.0)
    t.color.g    = love.math.random(0.2,1.0)
    t.color.b    = love.math.random(0.2,1.0)
end

function change_size(t)
    t.w = love.math.random(8, 96)
    t.h = love.math.random(8, 96)
end

e:add_transform(1, 400,100)
e:add_timer(1,1, 0.1, 10,  change_color, "change_color")
--e:add_sprite(1, "spaceship-blue", 4)
--e:add_collision(1, 48,48)
--e:add_physics(1, 30, 30)

e:add_transform(2, 300,300)
--e:add_timer(2,1, 1.5, 5,  change_color, "change_color")
e:add_timer(2,1, 0.7, 100,  change_size, "change_size")

e:add_transform(3, 100,500)

function love.load()
end

function love.update(dt)
    --System.collisionWithEntities(e.components)
    
    delta = dt

    -- Collision and Physics order is important!
    --System.collision(e.components)
    --System.physics(e.components, dt)
    --System.move(e.components, dt)
    System.timer(e.components, dt)
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

   --if key == "space" then
       --print("Space")
        --toggle = not toggle
   --end
end
