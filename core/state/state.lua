local Stack   = require('core.ds.stack')

local State = {}
State.__index = State

function State.new()
    local obj = setmetatable({}, State)

    obj.states = Stack.new()

    return obj
end

function State:push(item)
    self.states:push(item)
end

function State:pop()
    return self.states:pop()
end

function State:current()
    return self.states.items[1]
end

function State:update(dt)
    self.states.items[1]:update(dt)
end

return State
