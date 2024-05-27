local R        = require('core.gfx.render')
local Color   = require('core.gfx.color')
local Entity = require('game.ecs.entity.entity')
local Transform = require('game.ecs.component.transform')
local renderSystem = require('game.ecs.system.render')
local moveSystem = require('game.ecs.system.move')


local SPEED = 400


local entities = {
   {
      transform = {x = 100, y = 200, w = 20, h = 20},
      color = {r = 100, g = 200, b = 255, a = 255},
      movement = {x = SPEED, y = SPEED, dx = -1, dy = -1},
   },
   {
      transform = {x = SPEED, y = 500, w = 20, h = 20},
      color = {r = 200, g = 0, b = 255, a = 255},
      movement = {x = SPEED, y = SPEED, dx = 1, dy = 1},
   },
   {
      transform = {x = 150, y = 100, w = 30, h = 30},
      color = {r = 120, g = 50, b = 55, a = 255},
      movement = {x = SPEED, y = SPEED, dx = -1, dy = -1},
   },
}


for _= 1, 10, 1 do

   
   local rx = love.math.random(10,500)
   local ry = love.math.random(10,500)
   local rr = love.math.random(20,255)
   local rg = love.math.random(20,255)
   local rb = love.math.random(20,255)
   local ra = love.math.random(20,255)
   local rs = love.math.random(50,400)
   local rdx = love.math.random(-1,1)
   local rdy = love.math.random(-1,1)

   local t = { x=  rx, y = ry, w = 20, h = 20  }
   local c = {r = rr, g = rg, b = rb, a = ra}
   local m = {x = rs, y = rs, dx = rdx, dy = rdy}

   local e = {
      transform = t,
      color = c,
      movement = m,
   }



   table.insert(entities, e)
end

local e1 = Entity.new()
--e1:addComponent("transform", Transform.new(100,100))




function love.load()
end

function love.update(dt)
   moveSystem(entities, dt)
end

function love.draw()

    R:clear(Color.BLACK)
   renderSystem(entities)
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
