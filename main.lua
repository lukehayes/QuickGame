local R      = require('core.gfx.render')
local Color  = require('core.gfx.color')
local ECS    = require('core.ecs.ecs')
local System = require('core.ecs.system.system')
local Player = require('core.player')
local PlayerUtil = require('game.player')
local Game = require('game.game')
local MobUtil = require('game.mob-util')


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
    Game.mob_gen_counter = Game.mob_gen_counter + dt

    if Game.mob_gen_counter >= Game.mob_gen_rate then
        Game.mob_can_generate = true
        Game.mob_gen_counter = 0
    end

    if Game.mob_can_generate then
        print("Mob")
        MobUtil.mob_generate(p)
        Game.mob_can_generate = false
    end

    
    PlayerUtil.player_shoot(p,dt)

    for _,b in pairs(Game.player_shots) do
        b:update(dt)
    end

    for _,m in pairs(Game.mobs) do
        m:update(dt)
    end

end

function love.draw()

    R:clear(Color.BLACK)
    R:draw(p)

    for k,b in pairs(Game.player_shots) do
        R:draw(b)
    end

    for k,m in pairs(Game.mobs) do
        R:draw(m)
    end

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
