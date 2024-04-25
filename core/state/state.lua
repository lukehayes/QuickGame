-----------------------------------------------------------
-- State.
-- A state manager -> just inherits from core.ds.stack.
--
-- @classmod core.state
local Stack   = require('core.ds.stack')

local State = {}
State.__index = State

-----------------------------------------------------------
-- Constructor.
--
-- Create a new State object.
--
-- @treturn State    A new instance of State.
function State.new()
    local obj = setmetatable({}, State)

    obj.states = Stack.new()

    return obj
end

-----------------------------------------------------------
-- Push an state into the internal stack.
--
-- @param item    The item to be pushed.
function State:push(item)
    self.states:push(item)
end

-----------------------------------------------------------
-- Pop a state from the internal stack.
--
-- @return Returns the item if exists, false otherwise.
function State:pop()
    return self.states:pop()
end

-----------------------------------------------------------
-- Get the current state at the top of the internal stack.
--
-- @treturn number Returns state if true, nil otherwise.
function State:current()
    return self.states.items[1]
end

-----------------------------------------------------------
-- Update the next frame of the top most state.
--
-- @tparam number dt    Delta time.
--
-- @treturn number Returns state if true, nil otherwise.
function State:update(dt)
    self.states.items[1]:update(dt)
end

return State
