---------------------------------------------------------------------------------
-- Utility helper functions are defined here.
--
-- @module core.util
--
local Util = {}

---------------------------------------------------------------------------------
-- Find a value in a table.
--
-- @tparam table t    The table to search.
-- @param  e          The element to search for.
--
-- @treturn Element if found, false otherwise.
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

---------------------------------------------------------------------------------
-- Read a entire file into a string and return it.
--
-- @tparam string file    Full path the file.
--
-- @treturn string    The whole file contents.
Util.read_file = function(file)
    local fh = io.open(file)
    local str = fh:read("*all")
    fh:close()
    return str
end

---------------------------------------------------------------------------------
-- Is the parameter of type table?
--
-- @tparam table t
--
-- @treturn bool    True if t is table,false otherwise.
Util.is_table = function(t)
    return type(t) == 'table'
end


return Util
