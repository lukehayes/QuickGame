-----------------------------------------------------------
-- Collision Rectangle.
-- Class that defines a rectangle and manages simple collisions.
--
-- @classmod core.col.col-rect
local M  = require('core.math.math')
local V2 = require('core.math.vec2')

local ColRect = {}
ColRect.__index = ColRect

-----------------------------------------------------------
-- Constructor
--
-- @tparam number x The x position.
-- @tparam number y The y position.
-- @tparam number scale The width and height of the entity. Defalts to 10.
--
function ColRect:new(x,y, scale)

    local col = setmetatable({}, ColRect)

    -- Public
    --
    col.position = V2:new(x,y)
    col.scale    = scale or 160
    col.color    = {r=1,g=1,b=1,a=1}
    col.name     = "ColRect"

    -- Can the collision rect be seen?
    col.visible  = true

    -- Does the collision rect detect collisions?
    col.disabled = false

    -- Bool check for the collision system.
    col.collisionJustHappened = false

    -- Cooldown time until another collision can happen.
    col.collisionCooldown = 0.5
    col.collisionCooldownTimer = 0

    return col
end

-----------------------------------------------------------
-- Set the collision rect to visible.
--
function ColRect:setVisible()
    self.color.a = 0.75
    self.visible = true
end

-----------------------------------------------------------
-- Disable this collision rects collision.
--
function ColRect:disable()
    self.disabled = true
end

-----------------------------------------------------------
-- Is another entity totally inside this collision rect?
---
-- @param entity The entity to check.
--
-- @return bool If the entity is contained.
function ColRect:overlaps(entity)
    --print(entity)
    return M.overlaps(self, entity)
end

-----------------------------------------------------------
-- Is another entity totally inside this collision rect?
---
-- @param entity The entity to check.
--
-- @return bool If the entity is contained.
function ColRect:inside(entity)
    return M.inside(self, entity)
end


-----------------------------------------------------------
-- Update the entity.
--
-- @param dt Delta time.
function ColRect:update(dt)
end

-----------------------------------------------------------
-- Draw the entity.
--
function ColRect:draw()
    self.gfx:drawEntity(self)
end

return ColRect
