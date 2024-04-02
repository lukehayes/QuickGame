local Class = {name = "Class"}
Class.__index = Class

function Class:new()
    local instance = {}

    print("Called")

    setmetatable(instance, self)

    return instance
end

function Class:getName()
   print("Name:", self.name)
end

local Object = {}

function Object:new()
    local instance = Class:new()

    instance.name = "Object"

    setmetatable(instance, {__index = self})

    return instance
end

local Mob = {}

function Mob:new()
    local instance = Object:new()

    instance.name = "Mob"

    setmetatable(instance, self)
    self.__index = self

    return instance
end



--c1 = Class:new()
--c1:getName()

--o1 = Object:new()
--o1:getName()

m1 = Mob:new()

