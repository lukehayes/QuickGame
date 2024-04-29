-----------------------------------------------------------
-- Animated Sprite.
-- An animated sprite.
--
-- @classmod core.gfx.animated-sprite
--
local Entity  = require('core.entity.entity')

local AnimatedSprite = {}
AnimatedSprite.__index = AnimatedSprite

-----------------------------------------------------------
-- Constructor.
--
-- Create a new AnimatedSprite.
--
-- @treturn AnimatedSprite A new instance of AnimatedSprite..
function AnimatedSprite.new(x,y)

    local obj = Entity.new(x,y)
    setmetatable(obj, AnimatedSprite)

    return AnimatedSprite
end

return AnimatedSprite
