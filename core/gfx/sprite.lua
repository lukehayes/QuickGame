-----------------------------------------------------------
-- Sprite
-- An class that can draw a single sprite.
--
-- @classmod core.gfx.sprite
--
local Entity  = require('core.entity.entity')
local Object  = require('core.object')

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

    local obj = setmetatable(Entity.new(x,y), Sprite)

    obj.name  = "Sprite"
    obj.image = love.graphics.newImage(image)
    obj.image:setFilter('nearest', 'nearest')
    obj.flip = false

    return obj
end

function Sprite:draw()
    love.graphics.draw(self.image, self.position.x, self.position.y, 0, self.scale,self.scale)
end

return Sprite
