-- All object, entity, mob creation functions are defined in here.
--

local V2 = require('core.math.vec2')

local ObjectFactory = {}
ObjectFactory.__index = ObjectFactory

function ObjectFactory:initObject(x,y)

    Object = {
        name  = "Object",
        position = V2:new(x,y),
        scale = 30,
        color = {r=1, g = 0, b = 1, a = 1},
        style = 'fill'
    }

    Object.__index = Object

    return Object
end

function ObjectFactory:initEntity(x,y)

    Entity = {
        name  = "Entity",
        color = {r=1, g = 0, b = 0, a = 1}
    }
    Entity.__index = Entity

    Object = ObjectFactory:initObject(x,y)
    Object.__index = Object

    return setmetatable(Entity, Object)
end

function ObjectFactory:initMob(x,y)

    local MobList = require('game.mobs')
    local randomMob = MobList[love.math.random(#MobList)]

    local Mob = {
        name  = randomMob.name,
        color = randomMob.color,
        speed = randomMob.speed
    }
    Mob.__index = Mob

    Entity = ObjectFactory:initEntity(x,y)
    Entity.__index = Object

    return setmetatable(Mob, Entity)

end

function ObjectFactory:initMegaMob(x,y)

    local MegaMob = {
        name  = "MegaMob",
        scale = 100,
        color = {r=0, g = 1, b = 1, a = 1}
    }
    MegaMob.__index = MegaMob

    Mob = ObjectFactory:initMob(x,y)
    Mob.__index = Object

    return setmetatable(MegaMob, Mob)
end

function ObjectFactory:initRock(x,y)

    local Rock = {
        name  = "Rock",
        scale = love.math.random(1,4),
        color = {r=0, g = 1, b = 1, a = 1},
        sprite = love.graphics.newImage('assets/rock1.png')
    }
    Rock.__index = Rock

    Rock.sprite:setFilter('nearest', 'nearest')

    Mob = ObjectFactory:initEntity(x,y)
    Mob.__index = Object

    return setmetatable(Rock, Mob)
end

return ObjectFactory
