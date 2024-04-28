-----------------------------------------------------------
-- Quadtree.
-- A simple quad tree implementation.
-- A quadtree data structure.
--
-- @classmod core.ds.quadtree
local Rectangle = require('core.math.rectangle')

local QuadTree = {}
QuadTree.__index = QuadTree

-----------------------------------------------------------
-- Constructor.
--
-- Create a new quad tree object.
--
-- @tparam Rectangle boundary
--
-- @return Quadtree.
function QuadTree.new(boundary)

    local qt = setmetatable({}, QuadTree)

    qt.boundary = boundary
    qt.points   = {}
    qt.capacity = 4
    qt.divided = false

    qt.nw = nil
    qt.ne = nil
    qt.sw = nil
    qt.se = nil

    return qt
end

-----------------------------------------------------------
-- Clear every point in each Quadtree by setting it to nil.
--
-- @param qt    The quad tree.
function QuadTree.clear(qt)

    if not qt then
        return
    end

    for i=1,#qt.points do
        qt.points[i] = nil
    end

    QuadTree.clear(qt.nw)
    QuadTree.clear(qt.ne)
    QuadTree.clear(qt.sw)
    QuadTree.clear(qt.se)

end

-----------------------------------------------------------
-- Insert a new point into the quadtree.
--
-- @param qt       The quad tree.
-- @param point    The point(Rectangle) to insert.
function QuadTree.insert(qt,point)

    if not Rectangle.inside(point, qt.boundary) then
        print("NO RECT!")
        return
    end

    if #qt.points < qt.capacity then
        table.insert(qt.points, point)
    else

        if not qt.divided then
            QuadTree.subdivide(qt)
            qt.divided = true
        end

        QuadTree.insert(qt.ne, point)
        QuadTree.insert(qt.nw, point)
        QuadTree.insert(qt.se, point)
        QuadTree.insert(qt.sw, point)
    end
end

-----------------------------------------------------------
-- Insert a new point into the quadtree.
--
-- @param qt       The quad tree.
function QuadTree.subdivide(qt)

    local newXP     = qt.boundary.x
    local newYP     = qt.boundary.y
    local newWidth  = qt.boundary.width / 2
    local newHeight = qt.boundary.height / 2

    local nw = Rectangle:new(newXP, newYP, newWidth, newHeight)
    local ne = Rectangle:new(newXP + newWidth, newYP, newWidth, newHeight)
    local sw = Rectangle:new(newXP, newYP + newHeight, newWidth, newHeight)
    local se = Rectangle:new(newXP + newWidth, newYP + newHeight, newWidth, newHeight)

    qt.ne = QuadTree.new(ne)
    qt.nw = QuadTree.new(nw)
    qt.se = QuadTree.new(se)
    qt.sw = QuadTree.new(sw)
end

-----------------------------------------------------------
-- Draw the quad tree.
--
-- @param qt       The quad tree.
function QuadTree.draw(qt)

    if not qt then
        return
    end

    love.graphics.rectangle('line', qt.boundary.x, qt.boundary.y, qt.boundary.width, qt.boundary.height)

    QuadTree.draw(qt.ne)
    QuadTree.draw(qt.nw)
    QuadTree.draw(qt.se)
    QuadTree.draw(qt.sw)
end

return QuadTree
