-----------------------------------------------------------
-- Entity.
-- The Entity base class
--
-- @classmod core.entity.entity
local Object  = require('core.object')

local Entity = {}
Entity.__index = Entity

-----------------------------------------------------------
-- Constructor.
--
-- Create a new Entity object.
--
-- @treturn Entity A new instance of Entity.
function Entity.new(x,y)

    local obj = setmetatable({}, { __index = Entity } )
    setmetatable(Entity, Object.new(x,y))

    obj.name  = "Entity"
    obj.color = {r=0.5, g = 0.6, b = 1, a = 1}

    return obj
    --return setmetatable(obj, Object.new(x,y) )
end

function Entity:hello()
    Object.hello(self)
    --print("Entity: xxx hello xxx")
end

-----------------------------------------------------------
-- Update.
--
-- Create a new Entity object.
--
-- @tparam number dt    Delta time.
--
function Entity:update(dt)
    print("Entity update")
    --self.position.x = self.position.x * 100 * dt
end

function Entity:draw()
    love.graphics.rectangle('fill', self.position.x, self.position.y,  self.scale,self.scale)
end

return Entity
