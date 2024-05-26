
-----------------------------------------------------------
-- Animated Sprite.
-- An animated sprite.
--
-- @classmod core.gfx.animated-sprite
--
local AnimatedSprite  = require('core.gfx.animated-sprite')

local StateEntity = {}
StateEntity.__index = StateEntity

-----------------------------------------------------------
-- Constructor.
--
-- Create a new StateEntity.
--
-- @treturn StateEntity A new instance of StateEntity..
function StateEntity.new(x,y,image, speed, animation)

    local anim = animation or "Idle"
    local obj = setmetatable(AnimatedSprite.new(x,y, image, speed, anim), StateEntity)

    obj.name = "StateEntity"

    obj.states = {"Idle", "Walk"}

    return obj
end

function StateEntity:play(animation)
    AnimatedSprite.play(self, animation)
end

function StateEntity:update(dt)
    AnimatedSprite.update(self, dt)
end

function StateEntity:draw()
    AnimatedSprite.draw(self)
end

return StateEntity
