local Component = require('game.ecs.component.component')
local Vec2 = require('core.math.vec2')

Transform = {}
Transform.__index = Transform

function Transform.new(x,y)
    local obj = setmetatable(Component.new(), Transform)

    obj.name = "Transform"

    obj.position = Vec2.new(x,y)
    obj.color = {r = 200, g = 0, b = 0, a = 255}

    return obj
end

return Transform

