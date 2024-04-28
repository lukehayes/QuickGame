-----------------------------------------------------------
-- Entity.
-- The Entity base class
--
-- @classmod core.entity
local Factory = require('core.object-factory')

local Entity = {}
Entity.__index = Entity

-----------------------------------------------------------
-- Constructor.
--
-- Create a new Entity object.
--
-- @treturn Entity A new instance of Entity.
function Entity.new(x,y)

    local obj = {}

    obj.name  = "Entity"
    obj.color = {r=0, g = 0, b = 0, a = 1}

    return setmetatable(obj, {__index = Factory:initObject(x,y)})
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
end


return Entity
