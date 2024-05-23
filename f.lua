Base = {}
Base.__index = Base

function Base.new()
    local obj = setmetatable({}, Base)
    obj.val = 1
    obj.name = "Base"

    return obj
end

function Base:getData()
    print("Base --> Name: ", self.name, "Val: ", self.val)
end


Foo = {}
Foo.__index = Foo

function Foo.new()
    local obj = setmetatable({}, {__index = Foo})
    --setmetatable(obj, { __index = Base.new() })

    obj.val = 2
    obj.name = "Foo"

    return obj
end

function Foo:getData()
    print("----------------------------------")
        Base.getData(self)
        print("Foo --> Name: ", self.name, "Val: ", self.val)
    print("----------------------------------")
end


local b = Base.new()
b:getData()

local f = Foo.new()
f:getData()
