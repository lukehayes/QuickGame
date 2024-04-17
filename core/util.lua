local Util = {}

--- Find a value in a table.
--
-- @param t    The table to search.
-- @param e    The element to search for.
--
-- @return Element if found, false otherwise.
Util.find = function(t,e)

    if #t == 0 then
        return false
    end

    for i=1,#t do
        if t[i] == e then
            return i
        end
    end

    return false
end


return Util
