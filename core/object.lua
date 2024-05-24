-----------------------------------------------------------
-- Object.
-- Base class for al things.
--
-- @classmod core.object
--
local V2 = require('core.math.vec2')

local Object = {}
Object.__index = Object

-----------------------------------------------------------
-- Constructor.
--
-- Create a new Object.
--
-- @treturn Object A new instance of Object..
function Object.new(x,y)

    local obj = setmetatable({}, {__index = Object})

    obj.name     = "Object"
    obj.position = V2:new(x,y)
    obj.scale    = 10
    obj.color    = {r=1, g = 0, b = 1, a = 1}
    obj.style    = 'fill'
    obj.speed    = 200

    return obj
end

function Object:update(dt)
    print("Object Delta: ", dt)

    self.position.x = self.position.x + 1 * self.speed * dt
end

-----------------------------------------------------------
-- Static helper method for inheritance.
--
-- Create a new Object.
--
-- @param child
-- @param parent
--
-- @return Object
function Object:inherit(child, parent)

    -- TODO Implement this properly. Totally broken.

    local obj = setmetatable({}, Entity)
    setmetatable(Entity, {__index = Object.new(x,y)})


    return obj
end

function Object:hello()
    print("Object: hello")
end


return Object
