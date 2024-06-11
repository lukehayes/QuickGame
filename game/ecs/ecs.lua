ECS = {}
ECS.__index = ECS

-----------------------------------------------------------
-- Constructor.
--
-- Create a new instance of the ECS.
--
-- @treturn ECS    A new ECS instance.
function ECS.new()
    local obj = setmetatable({}, ECS)

    obj.components = {}
    obj.components.transform = {}

    return obj
end

-----------------------------------------------------------
-- find_entity
--
-- Find an entity
--
-- @tparam number id    The id of the entity to find.
--
-- @tparam string image    Path of the image to be drawn.
--
-- @treturn Entity    The instance of the entity with ID.
function ECS:find_entity(id)
    --TODO Find all of the components that have a specific ID.

    local entity = {}

    for _,component in pairs(self.components) do
        for _,c in pairs(component) do
            if c.id == id then
                table.insert(entity, c)
            end
        end
    end

    return entity
end

-------------------------------------------------------------------------------
-- get_entity_components
--
-- Get all of the components for an entity with a specific id.
--
-- @tparam number id    The id of the entity to find.
--
-- @treturn Entity    The instance of the entity with ID.
function ECS:get_entity_components(id)

    local entity = {
        transform = self.components.transform[id]
    }

    return entity
end

-----------------------------------------------------------
-- Add Transform
--
-- Add an entity transform component.
--
-- @tparam number x     The x position.
-- @tparam number y     The y position.
-- @tparam number id    The id of the entity.
--
-- @treturn Transform    Instance of the tranform component.
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
