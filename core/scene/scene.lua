local Object = require('core.object')
local R = require('core.gfx.render')

local Scene = {}
Scene.__index = Scene

function Scene.new()
    local scene = setmetatable(Object.new(), Scene)
    scene.name = "Scene"
    return scene
end

function Scene:update(dt)
    print("Scene Update", dt)
end

function Scene:render()
    print("Scene Render")
end

return Scene
