local Object = require 'core.object'

local Node = {}
Node.__index = Node

Node.__tostring = function(a)
  return "Node: { x: " ..
          a.position.x .. ", y: " ..
          a.position.y .. " }"
end

Node.__eq = function(a,b)
  return (rawequal(a,b))
end

function Node.new(x,y)
    local obj = setmetatable(Object.new(x,y), Node)

    obj.g = 0
    obj.h = 0
    obj.f = 0

    return obj
end


function AStar(grid, start, finish)

  startNode = Node.new(start)
  endNode = Node.new(finish)

  openGrid   = {}
  closedGrid = {}

  table.insert(openGrid, startNode)

  while #openGrid > 0 do
    currentNode = openGrid[1]
    currentIndex = 1


    for index, item in ipairs(openGrid) do
        if item.f < currentNode.f then
          currentNode = item
          currentIndex = index
        end
    end

    -- Pop the current node off the list and add to the closed.
    table.remove(openGrid, currentIndex)
    table.insert(closedGrid, currentNode)

  end

end

return Node
