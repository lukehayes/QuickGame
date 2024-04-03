local A = { name = "A"}
local B = { name = "B"}

setmetatable(B, {__index = A})

function A:is(T)
    print("A -> T ", T)
    print("Self -> T ", self == T)
    local mt = getmetatable(self)

    if mt == T then
        print("Yes, T is equal")
        return true

    else
        mt = getmetatable(mt)
        print("No, T is not equal", mt)

        while mt do
        print("Searching...")
            if mt == T then
                return true
            end

            mt = getmetatable(mt)
        end
        return false
    end
end

function A:getName()
    print(self.name)
end

B:getName()

print("B -> T", B)
print(B:is(B))
print(B:is(A))
