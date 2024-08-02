-- Simple astar path finding algorithm
--
function AStar(grid, start, finish)

  startNode = Node.new(start)
  endNode   = Node.new(finish)

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

return AStar
