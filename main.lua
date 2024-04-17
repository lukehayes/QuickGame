local Factory = require('core.object-factory')
local R       = require('core.render')
local P       = require('core.player')
local Stack   = require('core.ds.stack')
local State   = require('core.state.state')
local Game    = require('core.game')
local Rock    = require('game.rock')
local Entity  = require('core.entity')

r  = Rock.new(100,300)
e1 = Entity.new(400,200)

local rocks = {}

for i=1,100 do
    local rx = love.math.random(-300, Game.width)
    local ry = love.math.random(-300, Game.height)
    local r  = Rock.new(rx,ry)
    table.insert(rocks, r)
end


function love.load()
    p = P.new(100,100)
end

function love.update(dt)
    P.update(p, dt)

    for _, rock in pairs(rocks) do
        Rock.update(rock, dt)
    end
end

function love.draw()
    --R:draw_batch()
    R:draw_sprite(p)
    --R:draw_sprite(rock)


    for _, rock in pairs(rocks) do
        R:draw_sprite(rock)
    end
end


function love.mousepressed(x, y, button, istouch)
end
