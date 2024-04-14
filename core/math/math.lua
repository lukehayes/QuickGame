local CoreMath = {}

local V2 = require('core.math.vec2')

-- Averages an arbitrary number of angles (in radians).
function CoreMath.averageAngles(...)
    local x,y = 0,0
    for i=1,select('#',...) do local a= select(i,...) x, y = x+math.cos(a), y+math.sin(a) end
    return math.atan2(y, x)
end

-- Returns the distance between two points.
function CoreMath.distance(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end
-- Distance between two 3D points:
function CoreMath.distance3d(x1,y1,z1, x2,y2,z2) return ((x2-x1)^2+(y2-y1)^2+(z2-z1)^2)^0.5 end


-- Returns the angle between two points.
--function CoreMath.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end


-- Returns the closest multiple of 'size' (defaulting to 10).
function CoreMath.multiple(n, size) size = size or 10 return math.round(n/size)*size end


-- Clamps a number to within a certain range.
function CoreMath.clamp(low, n, high) return math.min(math.max(low, n), high) end


-- Linear interpolation between two numbers.
function CoreMath.lerp(a,b,t) return (1-t)*a + t*b end
function CoreMath.lerp2(a,b,t) return a+(b-a)*t end

-- Cosine interpolation between two numbers.
function CoreMath.cerp(a,b,t) local f=(1-math.cos(t*math.pi))*.5 return a*(1-f)+b*f end


-- Normalize two numbers.
function CoreMath.normalize(x,y) local l=(x*x+y*y)^.5 if l==0 then return 0,0,0 else return x/l,y/l,l end end


-- Returns 'n' rounded to the nearest 'deci'th (defaulting whole numbers).
function CoreMath.round(n, deci) deci = 10^(deci or 0) return math.floor(n*deci+.5)/deci end


-- Randomly returns either -1 or 1.
function CoreMath.rsign() return love.math.random(2) == 2 and 1 or -1 end


-- Returns 1 if number is positive, -1 if it's negative, or 0 if it's 0.
function CoreMath.sign(n) return n>0 and 1 or n<0 and -1 or 0 end


-- Gives a precise random decimal number given a minimum and maximum
function CoreMath.prandom(min, max) return love.math.random() * (max - min) + min end


-- Checks if two line segments intersect. Line segments are given in form of ({x,y},{x,y}, {x,y},{x,y}).
function CoreMath.checkIntersect(l1p1, l1p2, l2p1, l2p2)
    local function checkDir(pt1, pt2, pt3) return math.sign(((pt2.x-pt1.x)*(pt3.y-pt1.y)) - ((pt3.x-pt1.x)*(pt2.y-pt1.y))) end
    return (checkDir(l1p1,l1p2,l2p1) ~= checkDir(l1p1,l1p2,l2p2)) and (checkDir(l2p1,l2p2,l1p1) ~= checkDir(l2p1,l2p2,l1p2))
end

-- Checks if two lines intersect (or line segments if seg is true)
-- Lines are given as four numbers (two coordinates)
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
--                            VECTOR NGMATH                           --
------------------------------------------------------------------------

--- Get the dot product between two Vectors.
--
-- @param v1 The first vector.
-- @param v2 The second vector.
--
-- @return The dot product between v1 and v2.
function CoreMath.dot(v1,v2)
    return NGVec2:new(v1.x * v2.x, v1.y * v2.y)
end

-- Normalize a vector - (reduce its length to 1 but keep direction)
--
-- @param v1 The first vector.
--
-- @return The normalized vector.
function CoreMath.norm(v)

    local length = math.sqrt( (v.x * v.x) + (v.y * v.y) )

    if length ==0 then
        return NGVec2:new(0,0)
    else
        local ilength = 1.0/length
        return NGVec2:new(
            v.x*ilength,
            v.y*ilength
        )
    end
end

-- Get the distance between two vectors.
--
-- @param v1 The first vector.
-- @param v2 The second vector.
--
-- @return The distance.
function CoreMath.dist(v1,v2)
    return ((v2.x-v1.x)^2+(v2.y-v1.y)^2)^0.5
end

-- Get the angle between two vectors - in radians.
--
-- @param v1 The first vector.
-- @param v2 The second vector.
--
-- @return The angle.
function CoreMath.angle(v1,v2) 
    return math.atan2(v2.y - v1.y, v2.x - v1.x) 
end

-- Get the angle between two vectors - in degrees.
--
-- @param v1 The first vector.
-- @param v2 The second vector.
--
-- @return The angle in degrees.
function CoreMath.angleDegrees(v1,v2) 
    return math.deg(CoreMath.angle(v1,v2))
end

-- Helper function that returns a direction Vector2.
-- Uses CoreMath.angle internally.
--
-- @param v1 The first vector.
-- @param v2 The second vector.
--
-- @return Angle/Direction NGVec2.
function CoreMath.direction(v1,v2)
    local angle = CoreMath.angle(v1,v2)
    return NGVec2:new(math.cos(angle), math.sin(angle))
end

------------------------------------------------------------------------
--                             COLLISIONS                             --
------------------------------------------------------------------------

-- Simple AABB bounding box collision.
--
function CoreMath.collides(entity_a,entity_b)

  assert(entity_a ~= nil, "First collision argument is nil.")
  assert(entity_b ~= nil, "Second collision argument is nil.")

  return entity_a.position.x < entity_b.position.x + entity_b.scale and
         entity_b.position.x < entity_a.position.x + entity_a.scale and
         entity_a.position.y < entity_b.position.y + entity_b.scale and
         entity_b.position.y < entity_a.position.y + entity_a.scale
end

-- Simple AABB bounding box collision
--
function CoreMath.bb(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

-- Is the bounding box OVERLAPPING another?
--
-- @param entity_a
-- @param entity_b
--
-- @return bool True if overlap occured, false otherwise.
function CoreMath.BBOverlaps(entity_a, entity_b)

  --return entity_a.colRect.position.x < entity_b.colRect.position.x + entity_b.colRect.scale and
         --entity_b.colRect.position.x < entity_a.colRect.position.x + entity_a.colRect.scale and
         --entity_a.colRect.position.y < entity_b.colRect.position.y + entity_b.colRect.scale and
         --entity_b.colRect.position.y < entity_a.colRect.position.y + entity_a.colRect.scale

  return entity_a.position.x < entity_b.position.x + entity_b.scale and
         entity_b.position.x < entity_a.position.x + entity_a.scale and
         entity_a.position.y < entity_b.position.y + entity_b.scale and
         entity_b.position.y < entity_a.position.y + entity_a.scale
end

-- Is a BoundingBox COMPLETELY inside another?
--
-- @param entity_a
-- @param entity_b
--
-- @return bool True if overlap occured, false otherwise.
function CoreMath.BBInside(entity_a, entity_b)

    local a = entity_a.colRect
    local b = entity_b.colRect

    return a.position.x > b.position.x and
           a.position.x + a.scale < b.scale + b.position.x and
           a.position.y > b.position.y and
           a.position.y + a.scale < b.scale + b.position.y

end


------------------------------------------------------------------------
--                      COLLISION RECT VERSIONS                       --
------------------------------------------------------------------------


-- Is the bounding box OVERLAPPING another? COLLISION RECT VERSION.
--
-- @param entity_a
-- @param entity_b
--
-- @return bool True if overlap occured, false otherwise.
function CoreMath.BBOverlapsCR(cr_a, cr_b)

    return cr_a.position.x < cr_b.position.x + cr_b.scale and
         cr_b.position.x < cr_a.position.x + cr_a.scale and
         cr_a.position.y < cr_b.position.y + cr_b.scale and
         cr_b.position.y < cr_a.position.y + cr_a.scale
end

-- Is a BoundingBox COMPLETELY inside another?
--
-- @param cr_a
-- @param cr_b
--
-- @return bool True if overlap occured, false otherwise.
function CoreMath.BBInsideCR(a,b)

    return a.position.x > b.position.x and
           a.position.x + a.scale < b.scale + b.position.x and
           a.position.y > b.position.y and
           a.position.y + a.scale < b.scale + b.position.y

end

return CoreMath
