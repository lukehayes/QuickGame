-- All object, entity, mob creation functions are defined in here.
--
local ObjectFactory = {
    name        = "Object",
    scale       = 40,
    color       = {r=1, g = 0, b = 1, a = 1},
    render_list = {}
}
ObjectFactory.__index = ObjectFactory

print("ObjectFactory: ", ObjectFactory)

function ObjectFactory:add(e)
    table.insert(self.render_list, e)
end

function ObjectFactory:initObject(x,y)

    local instance = {}
    instance.x = x
    instance.y = y

    local newClass =  setmetatable(instance, ObjectFactory)
    print(newClass)
    return newClass
end

function ObjectFactory:initEntity(x,y)

    --local instance = ObjectFactory:initObject(x,y)
    local instance = setmetatable({},
        {__index = ObjectFactory:initObject(x,y)}
    )

    instance.name  = "Entity"
    instance.color = {r=1, g = 0, b = 0, a = 1}

    return instance
end

function ObjectFactory:initMob(x,y)

    --local instance = ObjectFactory:initEntity(x,y)
    local instance = setmetatable({},
        {__index = ObjectFactory:initEntity(x,y)}
    )

    instance.name  = "Mob"
    instance.scale = 10
    instance.color = {r=0, g = 1, b = 0, a = 1}

    return instance
end



return ObjectFactory
