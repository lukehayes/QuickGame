
Entity = {}
Entity.__index = Entity

function Entity.new()
    local obj = setmetatable({}, Entity)

    obj.components = {}

    return obj
end

function Entity:addComponent(name, component)

    table.insert(self.components, component)

    print("Component Count", #self.components)
end

function Entity:has(component)

    for k, v in pairs(self.components) do
        return v.name == component
    end
    print("----")
end

return Entity
