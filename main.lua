local AStar = require('core.ai.astar')
local GridNode = require('core.ai.grid-node')


local grid = {
  {0,0,0,0},
  {0,0,0,0},
  {0,0,0,0},
  {0,0,0,0}
}

test = {}
test.__index = test
test.__tostring = function()
  return "TEST"
end

g1 = GridNode.new(100,100, test)
g2 = GridNode.new(200,200)

print(g1)
print(g2)
