local Rectangle = require('core.math.rectangle')

local QuadTree = {}
--QuadTree.__index = QuadTree

function QuadTree:new(boundary)

    local qt = setmetatable({}, {__index = QuadTree})

    print("Boundary QT", boundary.width / 2)

    qt.boundary = boundary
    qt.points   = {}
    qt.capacity = 25

    print("-----------------------------------")
    print("BD Width", qt.boundary.width)
    print("BD Width / 2", qt.boundary.width / 2)
    print("-----------------------------------")

    return qt
end

function QuadTree:insert(point)

    local size = #self.points 

    if not Rectangle.inside(point, self.boundary) then
        print("Point not inside boundary.")
        --return
    end

    if size <= self.capacity then
        print("Current size: ", size)
        table.insert(self.points, point)
    else
        print("-------------")

        self:subdivide()

        self.ne:insert(point)
        self.nw:insert(point)
        self.se:insert(point)
        self.sw:insert(point)
    end
end

function QuadTree:subdivide()

    print("Subdividing")

    --print("WIDTH", self.boundary.width)

    local ne = Rectangle:new(self.boundary.x, self.boundary.y, self.boundary.width / 2, self.boundary.height / 2)
    local nw = Rectangle:new(self.boundary.x + self.boundary.width / 2, self.boundary.y, self.boundary.width / 2, self.boundary.height / 2)
    local se = Rectangle:new(self.boundary.x, self.boundary.y + self.boundary.height / 2, self.boundary.width / 2, self.boundary.height / 2)
    local sw = Rectangle:new(self.boundary.x + self.boundary.width / 2, self.boundary.y + self.boundary.height / 2, self.boundary.width / 2, self.boundary.height / 2)

    print("self:", self)

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
