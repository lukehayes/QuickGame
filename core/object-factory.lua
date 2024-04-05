-- All object, entity, mob creation functions are defined in here.
--
local ObjectFactory = {
    render_list = {}
}
ObjectFactory.__index = ObjectFactory

function ObjectFactory:add(e)
    table.insert(self.render_list, e)
end

function ObjectFactory:initObject(x,y)

    Object = {
        name  = "Object",
        x     = x,
        y     = y,
        scale = 30,
        color = {r=1, g = 0, b = 1, a = 1}
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

    return setmetatable(Entity, {__index = ObjectFactory:initObject(x,y)})
end

function ObjectFactory:initMob(x,y)

    local Mob = {
        name  = "Mob",
        color = {r=0, g = 1, b = 0, a = 1}
    }
    Mob.__index = Mob

    local instance = setmetatable(Mob, ObjectFactory:initEntity(x,y))

    return instance
end

function ObjectFactory:initMegaMob(x,y)

    local MegaMob = {
        name  = "MegaMob",
        scale = 100,
        color = {r=0, g = 1, b = 1, a = 1}
    }
    MegaMob.__index = MegaMob

    local instance = setmetatable({}, ObjectFactory:initMob(x,y))

    return instance
end

--local AT = {}
--local BT = {}
--setmetatable(ObjectFactory, {__index = AT})
--setmetatable(AT, {__index = BT})


--mt = getmetatable(ObjectFactory:initObject(10,10))
--mt = getmetatable(ObjectFactory:initEntity(10,10))
--mt = getmetatable(ObjectFactory:initMob(10,10))
--mt = getmetatable(ObjectFactory:initMegaMob(10,10))
--local c = 0

--while mt do
    --c = c + 1
    --c = c .. "."
    --print("Checking mt", c)
    --print(c)
    --mt = getmetatable(mt)
--end


return ObjectFactory
