Component = {}
Component.__index = Component

function Component.new()
    local obj = setmetatable({}, Component)

    obj.name = "Component"

    return obj
end

return Component

