-----------------------------------------------------------
-- Animated Sprite.
-- An animated sprite.
--
-- @classmod core.gfx.animated-sprite
--
local Sprite  = require('core.gfx.sprite')
local JSON    = require('libs.json')
local Util    = require('core.util')
local Data    = require('core.gfx.animation-data')

local AnimatedSprite = {}
AnimatedSprite.__index = AnimatedSprite

-----------------------------------------------------------
-- Constructor.
--
-- Create a new AnimatedSprite.
--
-- @treturn AnimatedSprite A new instance of AnimatedSprite..
function AnimatedSprite.new(x,y,image, speed)

    local obj = Sprite.new(x,y, image)
    setmetatable(obj, AnimatedSprite)
    setmetatable(AnimatedSprite, Sprite)

    obj.data = Data.new('assets/images/Pico8-Man.json')

    obj.frame       = 5
    obj.max_frame   = 9
    obj.frame_timer = 0
    obj.tile_size   = 8
    obj.playing     = false
    obj.current_animation = 'Idle'
    obj.animation = obj.data:get_animation(obj.current_animation)

    -- Generate all of the quads for the tilemap.
    obj.quads = {}
    for i=1,obj.data:get_size() do

        local x = i * obj.tile_size - obj.tile_size
        local quad = love.graphics.newQuad(x,0, obj.tile_size, obj.tile_size, obj.image)
        table.insert(obj.quads, quad)
    end

    obj.anim_speed = speed or 0.08

    return obj
end

function AnimatedSprite:play(animation)
    self.animation,
    self.start_frame,
    self.end_frame = self.data:get_animation(animation)

end

function AnimatedSprite:update(dt)

    if self.playing then
        self.frame_timer = self.frame_timer + dt

        if self.frame_timer > self.anim_speed then
            self.frame = self.frame + 1
            self.frame_timer = 0
        end

        if self.frame >= self.max_frame then
            self.frame = 5
        end
    end

end

function AnimatedSprite:draw()
    love.graphics.draw(self.image, self.quads[self.frame],  self.position.x, self.position.y, 0, self.scale, self.scale)
end

return AnimatedSprite
