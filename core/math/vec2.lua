--- Vec2
--
-- A Vec2 class
--
-- @classmod NGRenderer
local Vec2 = {}
Vec2.__index = Vec2

--- Constructor
--
-- Create a new instance of the Vec2 class.
--
-- @param x The x position of the vector.
-- @param y The y position of the vector.
--
-- @return A new instance of the Vec2 class.
function Vec2:new(x,y)

    local v = setmetatable({}, Vec2)

    v.x = x or 0
    v.y = y or 0

    return v
end

function Vec2:__tostring(args)
    return "Vec2(" .. self.x .. "," .. self.y .. ")"
end

function Vec2:add(other)
    return Vec2:new(self.x + other.x, self.y + other.y)
end

function Vec2:sub(other)
    return Vec2:new(self.x - other.x, self.y - other.y)
end

function Vec2:dot(other)
    return Vec2:new(self.x * other.x, self.y * other.y)
end

function Vec2:length()
    return math.sqrt( (self.x * self.x) + (self.y * self.y) )
end

Vec2.__add = Vec2.add
Vec2.__sub = Vec2.sub

--- Multiply a vector by a scalar.
--
-- @param n The scalar value to multiply the vector with.
--
-- @return A new Vec2 multiplied by n.
function Vec2:multiply(n)
    return Vec2:new(self.x * n, self.y * n)
end

return Vec2
