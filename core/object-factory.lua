-- All object, entity, mob creation functions are defined in here.
--
local ObjectFactory = {
    name        = "Object",
    x           = 10,
    y           = 10,
    scale       = 10,
    color       = {r=1, g = 0, b = 1, a = 1},
    render_list = {}
}
ObjectFactory.__index = ObjectFactory

function ObjectFactory:add(e)
    table.insert(self.render_list, e)
end

function ObjectFactory:initObject(x,y)

    local instance = {}

    instance.x = x
    instance.y = y

    return setmetatable(instance, ObjectFactory)
end

local Entity = {}
Entity.__index = Entity

function ObjectFactory:initEntity(x,y)

    --local instance = ObjectFactory:initObject(x,y)
    local instance = setmetatable(Entity, ObjectFactory:initObject(x,y))

    instance.__index = instance

    instance.name  = "Entity"
    instance.color = {r=1, g = 0, b = 0, a = 1}

    return instance
end

local Mob = {}
Mob.__index = Mob

function ObjectFactory:initMob(x,y)

    --local instance = ObjectFactory:initEntity(x,y)
    local instance = setmetatable(Mob, ObjectFactory:initEntity(x,y))

    instance.name  = "Mob"
    instance.color = {r=0, g = 1, b = 0, a = 1}

    return instance
end

local MegaMob = {}
MegaMob.__index = MegaMob
function ObjectFactory:initMegaMob(x,y)

    local instance = setmetatable({}, ObjectFactory:initMob(x,y))

    instance.name  = "MegaMob"
    instance.scale = 100
    instance.color = {r=0, g = 1, b = 1, a = 1}

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
