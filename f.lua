Base = {}
Base.__index = Base

function Base.new()
    local obj = setmetatable({}, {__index = Base})
    obj.val = 1
    return obj
end

function Base:getFoo()
    print("Value " .. self.val)
end

Foo = {}
Foo.__index = Foo

function Foo.new()
    local obj = setmetatable({}, {__index = Foo})
    setmetatable(Foo, Base)
    obj.val = 2
    return obj
end

Bar = {}
Bar.__index = Bar

function Bar.new()
    local obj = setmetatable({}, {__index = Bar})
    setmetatable(Bar, Foo.new())

    obj.val = 3

    return obj
end


b1 = Base.new()
print(b1.val)
b1:getFoo()

print("----")
f1 = Foo.new()
print(f1.val)
f1:getFoo()

print("----")
br1 = Bar.new()
print(br1.val)
br1:getFoo()
