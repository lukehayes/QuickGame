local Factory = require('core.object-factory')
local R       = require('core.render')
local P       = require('core.player')
local Rect    = require('core.math.rectangle')
local QT      = require('core.ds.quadtree')
local Stack   = require('core.ds.stack')
local State   = require('core.state.state')
local Util    = require('core.util')

st = State.new()

local p = P.new(100,100)
local rect = Rect:new(10,10,10,10)

local rocks = {}

for i=1,10 do

    local rx = love.math.random(10,1900)
    local ry = love.math.random(10,1080)

    local rock = Factory:initRock(rx,ry)
    table.insert(rocks, rock)
end

function love.load()
end

function love.update(dt)
    P.update(p, dt)

    print("State: ", st:current())
end

function love.draw()
    R:draw_batch()

    R:draw_sprite(p)
    --R:draw_sprite(rock)

    for _,r in pairs(rocks) do
        print(r.position)
        R:draw_sprite(r)
    end
end


function love.mousepressed(x, y, button, istouch)
end
