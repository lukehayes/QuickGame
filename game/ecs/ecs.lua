ECS = {}
ECS.__index = ECS

function ECS.new()
    local obj = setmetatable({}, ECS)

    obj.components = {}
    obj.components.transform = {}

    return obj
end

function ECS:find_entity(id)
    --TODO Find all of the components that have a specific ID.

    local entity = {}

    for k,component in pairs(self.components) do
        for _,c in pairs(component) do
            if c.id == id then
                table.insert(entity, c)
            end
        end
    end

    return entity
end

function ECS:sort_entities(id)
    --TODO Sort all of the entities to be in ID order.
end

function ECS:add_transform(x, y, id)

    local transform = {
        x     = x,
        y     = y,
        w     = 10,
        h     = 10,
        id    = id,
        speed = 1,
        dx    = love.math.random(-1,1),
        dy    = love.math.random(-1,1),
        name  = "transform",
        color = {r=255, g = 0, b = 0, a = 0}
    }

    table.insert(self.components.transform, id, transform)

    return transform
end

return ECS
