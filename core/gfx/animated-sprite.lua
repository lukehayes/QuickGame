-----------------------------------------------------------
-- Animated Sprite.
-- An animated sprite.
--
-- @classmod core.gfx.animated-sprite
--
local Sprite  = require('core.gfx.sprite')
local Data    = require('core.gfx.animation-data')

local AnimatedSprite = {}
AnimatedSprite.__index = AnimatedSprite

-----------------------------------------------------------
-- Constructor.
--
-- Create a new AnimatedSprite.
--
-- @treturn AnimatedSprite A new instance of AnimatedSprite..
function AnimatedSprite.new(x,y,image, speed, animation)

    local obj = setmetatable(Sprite.new(x,y, image), AnimatedSprite )

    obj.name = "AnimatedSprite"
    obj.data = Data.new('assets/images/Pico8-Man.json')

    obj.frame_timer = 0
    obj.tile_size   = 8
    obj.playing     = false

    obj.animation,
    obj.start_frame,
    obj.end_frame = obj.data:get_animation(animation)
    obj.frame     = obj.start_frame
    obj.origin_x  = obj.data:get_tile_size() / 2
    obj.origin_y  = obj.data:get_tile_size() / 2

    obj.anim_changed = false

    -- Generate all of the quads for the tilemap.
    obj.quads = {}
    for i=1,obj.data:get_size() do

        local x = i * obj.tile_size - obj.tile_size
        local quad = love.graphics.newQuad(x,0, obj.tile_size, obj.tile_size, obj.image)
        table.insert(obj.quads, quad)
    end

    obj.anim_speed = speed or 0.1

    return obj
end

function AnimatedSprite:play(animation)

    self.animation,
    self.start_frame,
    self.end_frame = self.data:get_animation(animation)

    if self.anim_changed then
        self.frame = self.start_frame
        self.anim_changed = true
    end
end

function AnimatedSprite:update(dt)

    self.frame_timer = self.frame_timer + dt

    if self.frame_timer >= self.anim_speed then
        self.frame = self.frame + 1
        self.frame_timer = 0
    end

    if self.frame >= self.end_frame + 1 then
        self.frame = self.start_frame
    end
end

function AnimatedSprite:draw()

    if self.flip then
        love.graphics.draw(self.image, self.quads[self.frame + 1],  self.position.x, self.position.y, 0, self.scale * -1, self.scale, self.origin_x, self.origin_y)
    else
        love.graphics.draw(self.image, self.quads[self.frame + 1],  self.position.x, self.position.y, 0, self.scale, self.scale, self.origin_x, self.origin_y)
    end

end

return AnimatedSprite
