-----------------------------------------------------------
-- Sprite
-- An class that can draw a single sprite.
--
-- @classmod core.gfx.sprite
--
local Entity  = require('core.entity.entity')

local Sprite = {}
Sprite.__index = Sprite

-----------------------------------------------------------
-- Constructor.
--
-- Create a new Sprite.
--
-- @tparam number x    The x position.
-- @tparam number y    The y position.
--
-- @tparam string image    Path of the image to be drawn.
--
-- @treturn Sprite A new instance of Sprite..
function Sprite.new(x,y, image)

    local sprite = Entity.new(x,y)
    setmetatable(sprite, Sprite)

    sprite.name = "Sprite"
    sprite.image = love.graphics.newImage(image)
    sprite.image:setFilter('nearest', 'nearest')

    return sprite
end

function Sprite:draw()
    print(self.position.x, self.position.y)
    love.graphics.draw(self.image, self.position.x, self.position.y, 0, self.scale,self.scale)
end

return Sprite
