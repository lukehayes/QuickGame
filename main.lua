local R        = require('core.gfx.render')
local P        = require('core.player')
local TM       = require('core.map.tiledmap')
local Game     = require('core.game')
local M        = require('core.math.math')
local V2       = require('core.math.vec2')
local Camera   = require('core.camera.camera')
local Entity   = require('core.entity.entity')

local e1 = Entity.new(10,10,100)
R:add(e1)


function love.load()
    p = P.new(100,100)
end

function love.update(dt)
    P.update(p, dt)
end

function love.draw()
    love.graphics.setBackgroundColor(0.5,0.5,0.5,1)
    R:draw_batch()
end

function love.mousepressed(x, y, button, istouch)
end
