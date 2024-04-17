local Node = {}
Node.__index = Node

function Node:new(width, height)

    local node = setmetatable({}, Node)

    node.children  = {}
    node.max_elems = 4
    node.width     = width
    node.height    = height

    return node
end


return Node
