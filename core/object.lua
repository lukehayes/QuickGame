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

    Object = {
        name  = "Object",
        position = V2:new(x,y),
        scale = 5,
        color = {r=1, g = 0, b = 1, a = 1},
        style = 'fill'
    }

    return Object
end

return Object
