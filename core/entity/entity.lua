-----------------------------------------------------------
-- Entity.
-- The Entity base class
--
-- @classmod core.entity.entity
local Object  = require('core.object')

--local Entity = setmetatable({}, Object)
--Entity.__index = Entity

local Entity = {}
Entity.__index = Entity

-----------------------------------------------------------
-- Constructor.
--
-- Create a new Entity object.
--
-- @treturn Entity A new instance of Entity.
function Entity.new(x,y)

    local obj = setmetatable(Object.new(x,y), Entity)

    obj.name  = "Entity"
    obj.color = {r=0.5, g = 0.0, b = 0, a = 1}
    obj.scale = 30

    return obj
end

function Entity:update(dt)
    print("Entity Delta: ", dt)
    Object.update(self, dt)
end

-----------------------------------------------------------
-- Update.
--
-- Create a new Entity object.
--
-- @tparam number dt    Delta time.
--

function Entity:draw()
    love.graphics.rectangle('fill', self.position.x, self.position.y,  self.scale,self.scale)
end

return Entity
