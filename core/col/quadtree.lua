local Rectangle = require('core.math.rectangle')

local QuadTree = {}
QuadTree.__index = QuadTree

function QuadTree:new(boundary)
    local qt = setmetatable({}, QuadTree)

    qt.boundary = boundary
    qt.points   = {}
    qt.capacity = 4

    self.ne = nil
    self.nw = nil
    self.se = nil
    self.sw = nil

    return qt
end

function QuadTree:insert(point)

    local size = #self.points

    if not Rectangle.inside(point, self.boundary) then
        return
    end

    if size < self.capacity then
        table.insert(self.points, point)
    else
        self:subdivide()

        self.ne:insert(point)
        self.nw:insert(point)
        self.se:insert(point)
        self.sw:insert(point)
    end
end

function QuadTree:subdivide()

    print("Subdividing...")

    local boundary = self.boundary

    local ne = Rectangle:new(boundary.x, boundary.y, boundary.width / 2, boundary.height / 2)
    local nw = Rectangle:new(boundary.x + boundary.width / 2, boundary.y, boundary.width / 2, boundary.height / 2)

    local se = Rectangle:new(boundary.x, boundary.y + boundary.height / 2, boundary.width / 2, boundary.height / 2)
    local sw = Rectangle:new(boundary.x + boundary.width / 2, boundary.y + boundary.height / 2, boundary.width / 2, boundary.height / 2)

    self.ne = QuadTree:new(ne)
    self.nw = QuadTree:new(nw)
    self.se = QuadTree:new(se)
    self.sw = QuadTree:new(sw)

end

function QuadTree:draw()

    love.graphics.rectangle('line', self.boundary.x, self.boundary.y, self.boundary.width, self.boundary.height)

    if self.ne then
        self.ne:draw()
    end

    if self.nw then
        self.nw:draw()
    end

    if self.se then
        self.se:draw()
    end

    if self.sw then
        self.sw:draw()
    end

end

return QuadTree
