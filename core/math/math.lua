---------------------------------------------------------------------------------
-- CoreMath
-- Mathematics helper functions.
--
-- @usage
--
-- local M = require('core.math.math')
-- local clamped_value = M.clamp(10,50,100)
--
-- @module core.math
--
local CoreMath = {}

local V2 = require('core.math.vec2')

------------------------------------------------------------------------
-- Averages an arbitrary number of angles (in radians).
--
-- @treturn number    The average of the angle.
function CoreMath.averageAngles(...)
    local x,y = 0,0
    for i=1,select('#',...) do local a= select(i,...) x, y = x+math.cos(a), y+math.sin(a) end
    return math.atan2(y, x)
end

------------------------------------------------------------------------
-- Returns the angle between two points.
--
-- @tparam number x1
-- @tparam number y1
-- @tparam number x2
-- @tparam number y2
--
-- @treturn number    The angle in radians.
function CoreMath.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end


------------------------------------------------------------------------
-- Returns the closest multiple of 'size' (defaulting to 10).
--
-- @tparam number n.
-- @tparam number size.
--
-- @treturn number    The multiple.
function CoreMath.multiple(n, size) size = size or 10 return math.round(n/size)*size end


------------------------------------------------------------------------
-- Clamps a number to within a certain range.
--
-- @tparam number low.
-- @tparam number n.
-- @tparam number high.
--
-- @treturn number    The multiple.
function CoreMath.clamp(low, n, high) return math.min(math.max(low, n), high) end


------------------------------------------------------------------------
-- Linear interpolation between two numbers.
--
-- @tparam number a.
-- @tparam number b.
-- @tparam number t.
--
-- @treturn number    The linear interpolated value.
function CoreMath.lerp(a,b,t) return (1-t)*a + t*b end

------------------------------------------------------------------------
-- Linear interpolation between two numbers - a different version.
--
-- @tparam number a.
-- @tparam number b.
-- @tparam number t.
--
-- @treturn number    The linear interpolated value.
function CoreMath.lerp2(a,b,t) return a+(b-a)*t end


------------------------------------------------------------------------
-- Cosine interpolation between two numbers.
--
-- @tparam number a.
-- @tparam number b.
-- @tparam number t.
--
-- @treturn number    The linear interpolated value.
function CoreMath.cerp(a,b,t) local f=(1-math.cos(t*math.pi))*.5 return a*(1-f)+b*f end


------------------------------------------------------------------------
-- Normalize two numbers.
--
-- @tparam number x.
-- @tparam number y.
--
-- @treturn number    The normalized value.
function CoreMath.normalize(x,y) local l=(x*x+y*y)^.5 if l==0 then return 0,0,0 else return x/l,y/l,l end end


------------------------------------------------------------------------
-- Returns 'n' rounded to the nearest 'deci'th (defaulting whole numbers).
--
-- @tparam number n.
-- @tparam number deci.
--
-- @treturn number    The rounded value.
function CoreMath.round(n, deci) deci = 10^(deci or 0) return math.floor(n*deci+.5)/deci end


------------------------------------------------------------------------
-- Randomly returns either -1 or 1.
--
-- @treturn number    The rounded value.
function CoreMath.rsign() return love.math.random(2) == 2 and 1 or -1 end


------------------------------------------------------------------------
-- Returns 1 if number is positive, -1 if it's negative, or 0 if it's 0.
--
-- @treturn number.
function CoreMath.sign(n) return n>0 and 1 or n<0 and -1 or 0 end


------------------------------------------------------------------------
-- Gives a precise random decimal number given a minimum and maximum
--
-- @tparam number min    The miniumum value.
-- @tparam number max    The maximum value.
--
-- @treturn number    The rounded value.
function CoreMath.prandom(min, max) return love.math.random() * (max - min) + min end


------------------------------------------------------------------------
-- Checks if two line segments intersect. Line segments are given in form of ({x,y},{x,y}, {x,y},{x,y}).
--
-- @tparam number l1p1
-- @tparam number l1p2
-- @tparam number l2p1
-- @tparam number l2p2
--
-- @treturn number    The rounded value.
function CoreMath.checkIntersect(l1p1, l1p2, l2p1, l2p2)
    local function checkDir(pt1, pt2, pt3) return math.sign(((pt2.x-pt1.x)*(pt3.y-pt1.y)) - ((pt3.x-pt1.x)*(pt2.y-pt1.y))) end
    return (checkDir(l1p1,l1p2,l2p1) ~= checkDir(l1p1,l1p2,l2p2)) and (checkDir(l2p1,l2p2,l1p1) ~= checkDir(l2p1,l2p2,l1p2))
end

------------------------------------------------------------------------
-- Checks if two lines intersect (or line segments if seg is true)
-- Lines are given as four numbers (two coordinates)
--
-- @tparam number l1p1x.
-- @tparam number l1p1y.
-- @tparam number l1p2x.
-- @tparam number l1p2y.
-- @tparam number l2p1x.
-- @tparam number l2p1y.
-- @tparam number l2p2x.
-- @tparam number l2p2y.
-- @tparam number seg1.
-- @tparam number seg2.
--
-- @treturn number    x and y position.
function math.findIntersect(l1p1x,l1p1y, l1p2x,l1p2y, l2p1x,l2p1y, l2p2x,l2p2y, seg1, seg2)
    local a1,b1,a2,b2 = l1p2y-l1p1y, l1p1x-l1p2x, l2p2y-l2p1y, l2p1x-l2p2x
    local c1,c2 = a1*l1p1x+b1*l1p1y, a2*l2p1x+b2*l2p1y
    local det,x,y = a1*b2 - a2*b1
    if det==0 then return false, "The lines are parallel." end
    x,y = (b2*c1-b1*c2)/det, (a1*c2-a2*c1)/det
    if seg1 or seg2 then
        local min,max = math.min, math.max
        if seg1 and not (min(l1p1x,l1p2x) <= x and x <= max(l1p1x,l1p2x) and min(l1p1y,l1p2y) <= y and y <= max(l1p1y,l1p2y)) or
            seg2 and not (min(l2p1x,l2p2x) <= x and x <= max(l2p1x,l2p2x) and min(l2p1y,l2p2y) <= y and y <= max(l2p1y,l2p2y)) then
            return false, "The lines don't intersect."
        end
    end
    return x,y
end


------------------------------------------------------------------------
--                            VECTOR MATH                             --
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Get the dot product between two Vectors.
--
-- @tparam Vec2 v1     The first vector.
-- @tparam Vec2 v2     The second vector.
--
-- @treturn number     The dot product between v1 and v2.
function CoreMath.dot(v1,v2)
    return V2:new(v1.x * v2.x, v1.y * v2.y)
end

------------------------------------------------------------------------
-- Normalize a vector - (reduce its length to 1 but keep direction)
--
-- @tparam Vec2 v1     The first vector.
--
-- @treturn Vec2       The normalized vector.
function CoreMath.norm(v)

    local length = math.sqrt( (v.x * v.x) + (v.y * v.y) )

    if length == 0 then
        return V2:new(0,0)
    else
        local ilength = 1.0/length
        return V2:new(
            v.x*ilength,
            v.y*ilength
        )
    end
end

------------------------------------------------------------------------
-- Get the length of a vector.
--
-- @tparam Vec2 v     The vector.
--
-- @treturn number    The length.
function CoreMath.length(v)
    return math.sqrt( (v.x * v.x) + (v.y * v.y) )
end

------------------------------------------------------------------------
-- Get the distance between two vectors.
--
-- @tparam Vec2 v1     The first vector.
-- @tparam Vec2 v2     The second vector.
--
-- @treturn number The distance.
function CoreMath.distance(v1,v2)
    return ((v2.x-v1.x)^2+(v2.y-v1.y)^2)^0.5
end

------------------------------------------------------------------------
-- Get the angle between two vectors - in radians.
--
-- @tparam Vec2 v1     The first vector.
-- @tparam Vec2 v2     The second vector.
--
-- @treturn number The angle.
function CoreMath.angle(v1,v2) 
    return math.atan(v2.y - v1.y, v2.x - v1.x) 
end

------------------------------------------------------------------------
-- Averages an arbitrary number of angles (in radians).
--
-- @treturn number The angle.
function CoreMath.averageAngles(...)
    local x,y = 0,0
    for i=1,select('#',...) do local a= select(i,...) x, y = x+math.cos(a), y+math.sin(a) end
    return math.atan2(y, x)
end

------------------------------------------------------------------------
-- Returns the closest multiple of 'size' (defaulting to 10).
--
-- @tparam number n     The multiple
-- @tparam Vec2 v2      The second vector.
-- @treturn number    The number.
function CoreMath.multiple(n, size) size = size or 10 return math.round(n/size)*size end


------------------------------------------------------------------------
--                             COLLISIONS                             --
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Simple AABB bounding box collision for any two generic objects
--- that both have an x and y position with a width and height.
--
-- @tparam number x1
-- @tparam number y1
-- @tparam number w1
-- @tparam number h1
-- @tparam number x2
-- @tparam number y2
-- @tparam number w2
-- @tparam number h2
--
-- @treturn bool If object is overlapping.
function CoreMath.aabb(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

------------------------------------------------------------------------
-- Is the bounding box overlapping another?
--
-- @tparam Entity a    The first entity to check.
-- @tparam Entity b    The second entity to check.
--
-- @return bool True if overlap occured, false otherwise.
function CoreMath.overlaps(a, b)

  -- assert(entity_a ~= nil, "First collision argument is nil. It should be of type Entity.")
  -- assert(entity_b ~= nil, "Second collision argument is nil. It should be of type Entity.")

    return a.position.x < b.position.x + b.scale and
           b.position.x < a.position.x + a.scale and
           a.position.y < b.position.y + b.scale and
           b.position.y < a.position.y + a.scale
end

------------------------------------------------------------------------
-- Check if an entity is completely inside a boundary
-- which is usually a rectangle.
--
-- @tparam Entity a
-- @tparam Entity b
--
-- @return bool True if overlap occured, false otherwise.
function CoreMath.inside(a,b)

    return a.position.x > b.position.x and
           a.position.x + a.scale < b.scale + b.position.x and
           a.position.y > b.position.y and
           a.position.y + a.scale < b.scale + b.position.y

end

------------------------------------------------------------------------
--                          MOVEMENT HELPERS                          --
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Move an entity towards a particular target.
--
-- @tparam Entity a
-- @tparam Entity b
-- @tparam number dt    Delta time.
-- @tparam number threshold    The distance to stop moving the entity.
function CoreMath.move_towards(entity_a, entity_b, dt, threshold)

    local angle = M.angle(entity_a.x, entity_a.y, entity_b.x, entity_b.y)
    local dist  = M.distance(entity_a.x, entity_a.y, entity_b.x, entity_b.y)

    -- Distance to target threshold when movement should stop.
    local threshold = threshold or 5

    if dist > threshold then
        entity_a.x = entity_a.x + math.cos(angle) * entity_a.speed * dt
        entity_a.y = entity_a.y + math.sin(angle) * entity_a.speed * dt
    else
        entity_a.x = entity_a.x
        entity_a.y = entity_a.y
    end
end


return CoreMath
