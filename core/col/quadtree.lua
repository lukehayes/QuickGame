local Node = require('core.col.node')


local QuadTree = {}

function QuadTree:new(width, height)
    local qt = {}

    qt.children = {}
    qt.max_children = 4
    qt.width  = width
    qt.height = height

    return qt
end


function QuadTree.build_qt(qt, depth, level)

    if level < depth then
        qt.width = qt.width / 2
        qt.height = qt.height / 2

        level = level + 1

        print(qt.width, qt.height)

        QuadTree.build_qt(qt, depth, level)
    end
end

function QuadTree.insert(qt)

    local length = #qt.children

    if length < qt.max_elems then
        local node = Node:new(qt.width, qt.height)
        table.insert(qt.children, node)
    else
        print("Subdivide")
        QuadTree.insert(qt)
    end
end

function QuadTree.draw(qt, xp, yp)

    -- @TODO Implmenent drawing the quad tree.

    local x = 0
    local y = 0

    --while qt.children do
        --love.graphics.rectangle("line", x,y, qt.width, qt.height )

        --x = x + qt.width
        --y = y + qt.height

        --QuadTree.draw(qt, x, y)
    --end
end

return QuadTree
