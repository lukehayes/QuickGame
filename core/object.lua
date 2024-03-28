local Object = {
    name  = "Object",
    x     = 10,
    y     = 10,
    scale = 40,
    color = {r=1, g = 0, b = 1, a = 1}
}

Object.__index = Object -- This is needed for inheritance to work!.

Object.__call = function()
    print("Functor")
end

function Object:new()
    local instance = {}
    return setmetatable(instance, {__index = self})
end

--- Check if a class is of a particular type.
--
-- @param t The type to check - should be a string.
--
-- @return true if t == self.name
function Object:isType(t)

    -- Is the current object equal to t?
    if self.name == t then
        return true
    else
        local mt = getmetatable(self)

        -- No, so check every child metatable until
        -- we either find t or the end of the
        -- metatable chain.
        while mt do
            if mt.name == t then
                return true
            end

            mt = getmetatable(mt)
        end
        return false
    end
end


function Object:get_name()
    return self.name
end

return Object
