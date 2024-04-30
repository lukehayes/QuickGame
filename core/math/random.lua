---------------------------------------------------------------------------------
-- Random
-- Helper functions for generating random numbers.
--
-- @module core.math.random
--
local Random = {}

---------------------------------------------------------------------------------
-- Get a random x and y value based on the global window width and height.
--
-- @treturn number x
-- @treturn number y
function Random.window_dimensions()
    local w,h = love.graphics.getDimensions()
    local rx  = love.math.random(0, w)
    local ry  = love.math.random(0, h)

    return rx,ry
end

return Random

