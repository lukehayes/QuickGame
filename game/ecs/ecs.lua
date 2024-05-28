ECS = {}
ECS.__index = ECS


function ECS.new()
    local obj = setmetatable({}, ECS)

    obj.components = {
        transform = {}
    }

    obj.entities = {}

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
        name  = "transform",
        color = {r=255, g = 0, b = 0, a = 0}
    }

    --self.entities[id].transform = transform

    local e = {}

    table.insert(e, transform)
    table.insert(self.entities, e)

    --table.insert(self.entities, transform, id)
end


return ECS
