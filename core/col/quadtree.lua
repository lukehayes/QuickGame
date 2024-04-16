local Rectangle = require('core.math.rectangle')

local QuadTree = {}
QuadTree.__index = QuadTree

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

function QuadTree.clear(qt)

    if #qt.ne.points > 0 then
        qt.ne = {}
    end

    if #qt.nw.points > 0 then
        qt.nw = {}
    end

    if #qt.se.points > 0 then
        qt.se = {}
    end

    if #qt.se.points > 0 then
        qt.se = {}
    end

end

function QuadTree.insert(qt,point)

    if not Rectangle.inside(point, qt.boundary) then
        return
    end

    if #qt.points < qt.capacity then
        table.insert(qt.points, point)
    else

        if not qt.divided then
            QuadTree.subdivide(qt, point)
            qt.divided = true
        end

        QuadTree.insert(qt.ne, point)
        QuadTree.insert(qt.nw, point)
        QuadTree.insert(qt.se, point)
        QuadTree.insert(qt.sw, point)
    end
end

function QuadTree.subdivide(qt, point)

    local newXP = qt.boundary.x
    local newYP = qt.boundary.y
    local newWidth = qt.boundary.width / 2
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
