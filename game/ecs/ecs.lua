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
    obj.components.collision = {}

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
-- @tparam number id    The id of the entity.
-- @tparam number x     The x position.
-- @tparam number y     The y position.
--
-- @treturn Transform    Instance of the tranform component.
function ECS:add_transform(id, x, y)

    local transform = {
        x     = x,
        y     = y,
        w     = 10,
        h     = 10,
        id    = id,
        speed = 200,
        dx    = love.math.random(1,1),
        dy    = love.math.random(-1,1),
        name  = "transform",
        color = {r=255, g = 0, b = 0, a = 0}
    }

    table.insert(self.components.transform, id, transform)

    return transform
end

-----------------------------------------------------------
-- Add Collision
--
-- Add an entity collision component.
--
-- @tparam number id    The id of the entity.
-- @tparam number x     The x position.
-- @tparam number y     The y position.
--
-- @treturn Transform    Instance of the tranform component.
function ECS:add_collision(id, width, height)

    local transform = self.components.transform[id]

    local col_w = width  or 30
    local col_h = height or 30

    if col_w <= transform.w then
        col_w = transform.w
    end

    if col_h <= transform.h then
        col_h = transform.h
    end


    local collision = {
        x     = transform.x - (col_w / 2),
        y     = transform.y - (col_h / 2),
        w     = col_w,
        h     = col_h,
        id    = id,
        name  = "collision",
        color = {r=1, g = 1, b = 1, a = 0.9}
    }

    table.insert(self.components.collision, id, collision)

    return collision
end

return ECS
