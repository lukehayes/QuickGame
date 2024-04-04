-- All object, entity, mob creation functions are defined in here.
--
local ObjectFactory = {

    name  = "Object",
    x     = 10,
    y     = 10,
    scale = 40,
    color = {r=1, g = 0, b = 1, a = 1},

    objects = {}
}
ObjectFactory.__index = ObjectFactory

function ObjectFactory:add(e)
    table.insert(self.objects, e)
end

function ObjectFactory.initEntity(x,y)
    local instance = setmetatable({}, ObjectFactory)

    instance.color = {r=1, g = 0, b = 0, a = 1}

    return instance
end


return ObjectFactory
