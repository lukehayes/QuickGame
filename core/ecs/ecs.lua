local Vec2 = require('core.math.vec2')
local M = require("core.math.math")

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
    obj.components.physics   = {}
    obj.components.collision = {}
    obj.components.sprites   = {}
    obj.components.timers    = {}

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
        dx    = love.math.random(-1,1),
        dy    = love.math.random(-1,1),
        name  = "transform",
        color = {r=0.5, g = 0.5, b = 0.6, a = 1}
    }

    table.insert(self.components.transform, id, transform)

    return transform
end

function ECS:add_physics(id, xv, yv)

    local rx = love.math.random(-1,1)
    local ry = love.math.random(-1,1)

    local physics = {
        velocity       = Vec2:new(xv,yv),
        acceleration   = Vec2:new(love.math.random(-20,20), love.math.random(-20,20)),
        speed          = 25,
        ACC_RATE       = 0.7, -- This actually moves things?
        SLOW_DOWN_RATE = 0.01,
        --dir            = Vec2:new(rx,ry),
        reset_time     = 3,
        time           = 0,
        angle          = 0,
        show_velocity  = true
   }

    local norm = M.norm(physics.velocity)
    physics.angle = math.atan2(norm.y, norm.x)

   table.insert(self.components.physics, id, physics)

   return physics
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

    if spr then
        --  If colllsion box same size
        if width == spr.size * spr.scale then
            x = transform.position.x
            y = transform.position.y
            col_w = spr.size * spr.scale
            col_h = spr.size * spr.scale
        else
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
        triggered = false
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

-----------------------------------------------------------
-- Add Timer
--
-- Add a timer to the entity. Each entity has their own
-- table of timers so can have any amount.
--
-- @tparam number id           The id of the entity.
-- @tparam number timer_id     The id of the specific timer.
-- @tparam number time         The runtime of the timer.
-- @tparam number repeats      The number of repeats the timer has.
-- @tparam function callback   The function to run on timeout.
-- @tparam string name         The name of the timer for identification.
--
-- @treturn
function ECS:add_timer(id, timer_id, time, repeats, callback, name)

    local timer  = {
        finished = false,
        oneshot  = oneshot or false,
        elapsed  = 0,
        time     = time,
        timeout  = false,
        current_repeats  = 0,
        repeats  = repeats,
        callback = callback,
        name     = name or "Timer"
    }

    local timers = self.components.timers

    if timers[id] then
        table.insert(self.components.timers[id], timer_id, timer)
    else
        local entity_timers = {}

        table.insert(entity_timers, timer_id, timer)
        table.insert(self.components.timers, id, entity_timers)
    end
end




return ECS
