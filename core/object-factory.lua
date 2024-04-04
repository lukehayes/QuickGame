-- All object, entity, mob creation functions are defined in here.
--
local ObjectFactory = {

    name  = "Object",
    x     = 10,
    y     = 10,
    scale = 40,
    color = {r=1, g = 0, b = 1, a = 1},

    render_list = {}
}
ObjectFactory.__index = ObjectFactory

function ObjectFactory:add(e)
    table.insert(self.render_list, e)
end

function ObjectFactory:initEntity(x,y, insert)

    local insert = insert or false

    local instance = setmetatable({}, ObjectFactory)

    instance.color = {r=1, g = 0, b = 0, a = 1}

    -- Automatically insert the object into the render list.
    if insert then
        self:add(instance)
    end

    return instance
end


return ObjectFactory
