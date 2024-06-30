local Mobs = require('game.mobs')
local Mob  = require('game.mob')
local Game = require('game.game')

local MobUtil = {}

function MobUtil.mob_generate(p)
    
    local mob = Mobs[love.math.random(1, #Mobs)]

    local e = Mob.new(
        love.math.random(10,700),
        love.math.random(10,700),
        p
    )

    print("Gen: ", mob.name)

    e.name   = mob.name
    e.health = mob.health
    e.speed  = mob.speed
    e.color  = mob.color

    game_add_mob(Game, e)
end


return MobUtil



