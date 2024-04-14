local Node = {}

function Node:new(width, height)

    local node = {}

    node.children  = {}
    node.max_elems = 4
    node.width     = width
    node.height    = height

    return node
end


return Node
