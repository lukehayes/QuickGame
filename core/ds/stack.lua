-----------------------------------------------------------
-- Stack.
-- A stack data structure.
--
-- @classmod core.ds.stack
local Stack = {}
Stack.__index = Stack

-----------------------------------------------------------
-- Constructor.
--
-- Create a new Stack object.
--
-- @treturn Stack    A new instance of Stack.
function Stack.new()

    local obj = setmetatable({}, Stack)

    obj.items = {}

    return obj
end

-----------------------------------------------------------
-- Push an item onto the stack.
--
-- @param item    The item to be pushed.
function Stack:push(item)
    table.insert(self.items, 1, item)
end

-----------------------------------------------------------
-- Pop an item from the stack.
--
-- @return Returns the item if exists, false otherwise.
function Stack:pop()
    if self:size() == 0 then
        return false
    else
        return table.remove(self.items, 1)
    end
end

-----------------------------------------------------------
-- Check if there are any items inside the stack.
--
-- @treturn number Returns true if there are ZERO items, false otherwise.
function Stack:empty()
    return self:size() == 0
end

-----------------------------------------------------------
-- Get the amount of elements inside the stack.
--
-- @treturn number    The number of items.
function Stack:size()
    return #self.items
end

return Stack
