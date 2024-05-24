-- *************************************************************************
-- This version of inheritance if apparently working.
-- *************************************************************************

Base = {}

function Base.new()
    local obj = setmetatable({}, { __index = Base })

    obj.name = "Base"
    obj.value = 1

    return obj
end

function Base:get()
    print("BASE: Name: ", self.name, " Value:", self.value)
end

Foo = {}
Foo.__index = {}

function Foo.new()
    local obj = setmetatable(Foo, { __index = Base.new() })

    obj.name = "Foo"
    obj.value = 2

    return obj
end

function Foo:get()
    print("Foo: Name: ", self.name, " Value:", self.value)
end


local b1 = Base.new()
b1:get()

local f1 = Foo.new()
f1.value = 123123123
f1:get()

local f2 = Foo.new()
f2:get()
