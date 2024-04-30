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

---------------------------------------------------------------------------------
-- Get a random x and y value based on the global window width and height.
--
-- @tparam number from    The minimum value of the range.
-- @tparam number from    The maximum value of the range.
--
-- @treturn number    A random value between from and to.
function Random.range(from, to)
    local from = from or 0
    local to   = to or 0
    return love.math.random(from, to)
end

return Random

