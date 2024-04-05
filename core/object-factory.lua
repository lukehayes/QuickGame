-- All object, entity, mob creation functions are defined in here.
--
local ObjectFactory = {}
ObjectFactory.__index = ObjectFactory

function ObjectFactory:initObject(x,y)

    Object = {
        name  = "Object",
        x     = x,
        y     = y,
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

    local Mob = {
        name  = "Mob",
        color = {r=0, g = 1, b = 0, a = 1}
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

return ObjectFactory
