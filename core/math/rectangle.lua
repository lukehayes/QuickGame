--- Represents a generic rectangle shape with an x,y position and a width and height.
--

local Rectangle = {}
Rectangle.__index = Rectangle

function Rectangle:new(x,y,width,height)
    local r = setmetatable({}, Rectangle)

    r.x      = x
    r.y      = y
    r.width  = width
    r.height = height

    r.dx = love.math.random(-1,1)
    r.dy = love.math.random(-1,1)
    
    if r.dx == 0 then
        r.dx = love.math.random(-1,1)
    end

    if r.dy == 0 then
        r.dy = love.math.random(-1,1)
    end

    r.speed = love.math.random(10,60)
    
    return r
end

function Rectangle:update(dt)

    self.x = self.x + self.dx + self.speed * dt
    self.y = self.y + self.dy + self.speed * dt

    if self.x < 0 or self.x > 1900 then
        self.dx = -self.dx
    end

    if self.y < 0 or self.y > 1050 then
        self.dy = -self.dy
    end

    print(self.dx, self.dy)
end


--- Check if another Rectangle object is completely inside this one.
--
-- @param Rectangle     rect    The other Rectangle to check.
-- @return boolean    True if inside, false otherwise.
function Rectangle:inside(rect)

    return self.x >= rect.x and
           self.x + self.width <= rect.width + rect.x and
           self.y >= rect.y and
           self.y + self.height <= rect.height + rect.y
end


--- Check if another Rectangle object is completely inside this one.
--- This is the generic/'static' version.
--
-- @param Rectangle     rect    The other Rectangle to check.
-- @return boolean    True if inside, false otherwise.
function Rectangle.inside(a,b)

    return a.x >= b.x and
           a.x + a.width <= b.width + b.x and
           a.y >= b.y and
           a.y + a.height <= b.height + b.y
end

return Rectangle
