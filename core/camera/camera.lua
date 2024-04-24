-----------------------------------------------------------
-- Camera.
-- A simple 2D camera implementation.
--
-- @usage
-- Cam:begin()
--    Cam:draw()
-- Cam:end()
--
-- @classmod core.camera.camera.
local Camera = {}
Camera.__index = Camera

-----------------------------------------------------------
-- Constructor
--
-- @tparam number x The x position.
-- @tparam number y The y position.
-- @tparam number width  The width of the camera screen.
-- @tparam number height The height of the camera screen.
function Camera.new(x,y,width, height)

    local obj        = {}

    obj.x            = x
    obj.y            = y
    obj.width        = width
    obj.height       = height
    obj.screenWidth  = love.graphics.getWidth()
    obj.screenHeight = love.graphics.getHeight()
    obj.zoom         = 1
    obj.target       = nil

    setmetatable(obj, {__index = Camera})

    return obj
end

-----------------------------------------------------------
-- Set the camera to follow a particular entity.
--
-- @param target    The entity to follow.
function Camera:setTarget(target)
    self.target = target
end

-----------------------------------------------------------
-- Update the camera.
--
-- @tparam number dt Delta time.
function Camera:update(dt)
end

--- Start the camera drawing. Pushes camera transformation onto stack.
--
function Camera:begin()
    love.graphics.push()
end

-----------------------------------------------------------
-- End the current drawing frame for the camera. 
-- Pops transformation of of the stack.
--
function Camera:flush()
    love.graphics.pop()
end

-----------------------------------------------------------
-- Draw the next camera frame.
function Camera:draw()
    
    if self.target then
        love.graphics.scale(self.zoom, self.zoom)
        love.graphics.translate(
            (self.target.scale - self.target.position.x) + self.screenWidth / 2,
            (self.target.scale - self.target.position.y) + self.screenHeight / 2
        )
    else
        love.graphics.scale(self.zoom, self.zoom)
        love.graphics.translate(self.x, self.y)
    end

end

return Camera
