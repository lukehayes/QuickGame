---------------------------------------------------------------------------------
-- A single Room node used in the Room tree generation.
--
-- @classmod core.procgen.room
--
local Room = {}

-----------------------------------------------------------
-- Constructor
--
-- Create a new Room.
--
-- @return A new instance of Room.
function Room.new()
    local obj = {}

    obj.nw = nil
    obj.ne = nil
    obj.se = nil
    obj.sw = nil

    return obj
end

function Room.print_tab(depth)
    for i=1,depth do
        io.write("\t")
    end
end

-----------------------------------------------------------
-- Print every room to std out recursively.
--
-- @tparam core.procgen.room room    The room root node.
-- @tparam number depth    The recursive depth. Defaults to 1.
function Room.print_rooms(room, depth)
    local depth = depth or 1

    io.write("Depth ", tostring(depth), " NorthWest: ", tostring(room.nw), "\n")
    Room.print_tab(depth)

    if room.nw then
        Room.print_rooms(room.nw, depth + 1)
    end

    -- ------------------------------------

    io.write("Depth ", tostring(depth), " NorthEast: ", tostring(room.ne), "\n")
    Room.print_tab(depth)

    if room.ne then
        Room.print_rooms(room.ne, depth + 1)
    end

    -- ------------------------------------
    io.write("Depth ", tostring(depth), " SouthWest: ", tostring(room.sw), "\n")
    Room.print_tab(depth)

    if room.sw then
        Room.print_rooms(room.sw, depth + 1)
    end

    -- ------------------------------------
    io.write("Depth ", tostring(depth), " SouthEast: ", tostring(room.se), "\n")
    Room.print_tab(depth)

    if room.se then
        Room.print_rooms(room.se, depth + 1)
    end
end

return Room
