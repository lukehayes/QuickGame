local Object = {

    name  = "Object",
    x     = 10,
    y     = 10,
    scale = 40,
    color = {r=1, g = 0, b = 0, a = 1}
}
Object.__index = Object -- This is needed for inheritance to work!.

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

--- Check if a class is of a particular type - The object version.
--
-- @param t The type to check - should be a string.
--
-- @return true if t == self.name
function Object:is(t)

    -- Is the current object equal to t?
    if self == t then
        return true
    else
        local mt = getmetatable(self)

        -- No, so check every child metatable until
        -- we either find t or the end of the
        -- metatable chain.
        while mt do
            if mt == t then
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

function Object.check_type(str_type, obj)
    print("------")
    print("Name ", obj:get_name())
    print("------")
    print(str_type .. " is Mob", obj:is(Mob))
    print(str_type .. " is Entity", obj:is(Entity))
    print(str_type .. " isType Mob", obj:isType('Mob'))
    print(str_type .. " isType Entity", obj:isType('Entity'))
    print("------")
end

return Object
