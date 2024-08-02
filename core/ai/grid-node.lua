local Object = require 'core.object'

local GridNode = {}
GridNode.__index = GridNode

GridNode.__tostring = function(a)
  return "GridNode: { x: " ..
          a.position.x .. ", y: " ..
          a.position.y .. " }" .. " " ..
          a.parent .. " "
end

GridNode.__eq = function(a,b)
  return (rawequal(a,b))
end

function GridNode.new(x,y, parent)

    local parent = parent or nil
    local obj    = setmetatable(Object.new(x,y), GridNode)

    setmetatable(GridNode, {__index = parent})
    obj.g = 0
    obj.h = 0
    obj.f = 0

    return obj
end

return GridNode
