local Vec2 = require('core.math.vec2')

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

    obj.components           = {}
    obj.components.transform = {}
    obj.components.collision = {}
    obj.components.sprites   = {}

    return obj
end

-------------------------------------------------------------------------------
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

-- ----------------------------------------------------------------------------
-- Add Transform
--
-- Add an entity transform component.
--
-- @tparam number id    The id of the entity.
-- @tparam number x     The x position.
-- @tparam number y     The y position.
--
-- @treturn Transform    Instance of the transform component.
function ECS:add_transform(id, x, y, w, h)

    local transform = {
        position = Vec2:new(x,y),
        w     = w or 16,
        h     = h or 16,
        id    = id,
        speed = love.math.random(100,300),
        dx    = love.math.random(1,1),
        dx    = love.math.random(-1,1),
        dy    = love.math.random(-1,1),
        name  = "transform",
        color = {r=255, g = 0, b = 0, a = 0}
    }

    table.insert(self.components.transform, id, transform)

    return transform
end

-- ----------------------------------------------------------------------------
-- Add Collision
--
-- Add an entity collision component.
--
-- @tparam number id    The id of the entity.
-- @tparam number x     The x position.
-- @tparam number y     The y position.
--
-- @treturn Transform    Instance of the transform component.
function ECS:add_collision(id, width, height)

    local transform = self.components.transform[id]
    local spr = self.components.sprites[id]
    local sprite_scale = nil

    local col_w = width or 100
    local col_h = height or 100
    --local sprite_scale_changed = false

    -- TODO Check if sprite exists and create collision box if it exists.

    if spr then

           print("Spr scale", spr.scale)

        -- TODO Sprite scale not taken into account yet.

        --  If colllsion box smaller
        if width < spr.size * spr.scale then
            print("Smaller", width, spr.size * spr.scale)
            x = transform.position.x + (spr.size * spr.scale - width)  / 2
            y = transform.position.y + (spr.size * spr.scale - height)  / 2
            col_w = width
            col_h = height
        end

        --  If colllsion box same size
        if width == spr.size * spr.scale then
            print("Equal size", "Width", width, "size * scale", spr.size * spr.scale)
            x = transform.position.x
            y = transform.position.y
            col_w = spr.size * spr.scale
            col_h = spr.size * spr.scale
        end

        --  If colllsion box bigger
        if width > spr.size * spr.scale then
            print("Bigger", "Width", width, "size * scale", spr.size * spr.scale)
            x = transform.position.x + (spr.size * spr.scale - width)  / 2
            y = transform.position.y + (spr.size * spr.scale - height)  / 2
            col_w = width
            col_h = height
        end
    else
        col_w = width
        col_h = height
        x = (transform.position.x + transform.w / 2) - (col_w / 2)
        y = (transform.position.y + transform.h / 2) - (col_h / 2)
        col_w = width or transform.w
        col_h = height or transform.h
    end

    local collision = {
        x     = x,
        y     = y,
        w     = col_w,
        h     = col_h,
        id    = id,
        name  = "collision",
        color = {r=0, g = 1, b = 1, a = 0.7},
    }

    table.insert(self.components.collision, id, collision)

    return collision
end

-----------------------------------------------------------
-- Add Sprite
--
-- Add a single sprite to an entity
--
-- @tparam number id       The id of the entity.
-- @tparam string image    The path of the image - .png format only.
--
-- @treturn Transform    Instance of the transform component.
function ECS:add_sprite(id, image, scale)

    local scale = scale or 1

    local sprite = {
        image = love.graphics.newImage('assets/images/'.. image ..'.png'),
        scale = scale
    }

    sprite.size = sprite.image:getWidth()

    sprite.image:setFilter('nearest', 'nearest')

    table.insert(self.components.sprites, id, sprite)
end





return ECS
