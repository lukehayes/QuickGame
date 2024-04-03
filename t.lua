local A = { name = "A"}
local B = { name = "B"}

setmetatable(B, {
    __index = function(T,K) 
        print(T, K)
    end,
    __add = function() print("Adding") end
})

function A:getName()
    print(self.name)
end

B:getName()
