local Scene      = require('core.scene.scene')
local R          = require('core.gfx.render')
local G          = require('game.game')
local Player     = require('core.player')
local PlayerUtil = require('game.player')
local MobUtil    = require('game.mob-util')

local DebugLevel = {}
DebugLevel.__index = DebugLevel

function DebugLevel.new()
    local scene = setmetatable(Scene.new(), DebugLevel)
    scene.name = "DebugLevel"

    scene.p = Player.new(100,100, 10)

    return scene
end

function DebugLevel:update(dt)
    print("Game Deltax", G.delta)
    Player.update(self.p, dt)

    G.mob_gen_counter = G.mob_gen_counter + dt

    if G.mob_gen_counter >= G.mob_gen_rate then
        G.mob_can_generate = true
        G.mob_gen_counter = 0
    end

    if G.mob_can_generate then
        MobUtil.mob_generate(self.p)
        G.mob_can_generate = false
    end

    for _,b in pairs(G.player_shots) do
        b:update(dt)
    end

    for _,m in pairs(G.mobs) do
        m:update(dt)
    end
end

function DebugLevel:render()
    --R:draw(self.p)

    for _,b in pairs(G.player_shots) do
        R:draw(b)
    end

    for _,m in pairs(G.mobs) do
        R:draw(m)
    end
end

return DebugLevel
