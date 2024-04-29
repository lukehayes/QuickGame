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

    local obj = setmetatable({}, Object)

    obj.name  = "Object"
    obj.position = V2:new(x,y)
    obj.scale = 5
    obj.color = {r=1, g = 0, b = 1, a = 1}
    obj.style = 'fill'

    return obj
end

return Object
