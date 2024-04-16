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

    return r
end


--- Check if another Rectangle object is completely inside this one.
--
-- @param Rectangle     rect    The other Rectangle to check.
-- @return boolean    True if inside, false otherwise.
function Rectangle:inside(rect)

    return self.x > rect.x and
           self.x + self.width < rect.width + rect.x and
           self.y > rect.y and
           self.y + self.height < rect.height + rect.y
end


--- Check if another Rectangle object is completely inside this one.
--- This is the generic/'static' version.
--
-- @param Rectangle     rect    The other Rectangle to check.
-- @return boolean    True if inside, false otherwise.
function Rectangle.inside(a,b)

    return a.x > b.x and
           a.x + a.width < b.width + b.x and
           a.y > b.y and
           a.y + a.height < b.height + b.y
end

return Rectangle
