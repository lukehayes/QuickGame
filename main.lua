local R     = require('core.render')
local P     = require('core.player')
local TM    = require('core.map.tiledmap')
local Game  = require('core.game')
local M     = require('core.math.math')
local V2    = require('core.math.vec2')
local STI   = require('libs.sti')

map = STI('assets/maps/map.lua')

function love.load()
    p = P.new(100,100)
end

function love.update(dt)
    P.update(p, dt)
end

function love.draw()
    --R:draw_batch()
    --R:draw_sprite(p)

    love.graphics.setBackgroundColor(0.5,0.5,0.5,1)
    map:draw()
end

function love.mousepressed(x, y, button, istouch)
end
