local Object = require('core.object')
local R = require('core.gfx.render')

local Scene = {}
Scene.__index = Scene

function Scene.new()
    local scene = setmetatable(Object.new(), Scene)
    scene.name = "Scene"

    scene.entities = {}

    return scene
end

function Scene:update(dt)
    print("Scene Update", dt)
end

function Scene:render()
    print("Scene Render")

    for k,entity in pairs(self.entities) do
        entity:render()
    end
end

function Scene:add(entity)
    print("Entity Added?")
    table.insert(self.entities, entity)
end

return Scene
