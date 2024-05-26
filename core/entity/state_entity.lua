
-----------------------------------------------------------
-- Animated Sprite.
-- An animated sprite.
--
-- @classmod core.gfx.animated-sprite
--
local AnimatedSprite  = require('core.gfx.animated-sprite')
local Timer  = require('core.math.timer')

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

    obj.timers = {
        Timer.new(1, false)
    }

    return obj
end

function StateEntity:play(animation)
    AnimatedSprite.play(self, animation)
end

function StateEntity:update(dt)
    AnimatedSprite.update(self, dt)

    for _, t in pairs(self.timers) do
        t:update(dt)

        if t.finished and t.running then
            local state = self.states[love.math.random(1,2)]
            self.position.x = self.position.x - 100 * dt
            self:play(state)
        end
    end

end

function StateEntity:draw()
    AnimatedSprite.draw(self)
end

return StateEntity
