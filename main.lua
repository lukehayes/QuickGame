local Factory = require('core.object-factory')
local R       = require('core.render')
local P       = require('core.player')
local QT      = require('core.col.quadtree')

mm = Factory:initEntity(10,10)
R:add(mm)

local p = player_init(100,100, 10)
R:add(p)


for i=1,10 do
    local rx = love.math.random(10,700)
    local ry = love.math.random(10,600)
    e = Factory:initMob(rx,ry)
    R:add(e)
end

function love.load()
end

function love.update(dt)
    player_update(p, dt)
end

function love.draw()
    R:draw_batch()
end
