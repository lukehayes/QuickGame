local R      = require('core.gfx.render')
local Color  = require('core.gfx.color')
local Entity = require('game.ecs.entity.entity')
local ECS    = require('game.ecs.ecs')
local render  = require('game.ecs.system.render')


local e = ECS.new()

e:add_transform(100,100,1)
--e:add_transform(300,100,1)
--e:add_transform(555,555,1)
--e:add_transform(533,355,2)
e:add_transform(100,300,2)

print("Length ", #e.components.transform)
print("Entity Length ", #e.entities)



function love.load()
end

function love.update(dt)
end

function love.draw()

    R:clear(Color.BLACK)

    render(e.components)
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
