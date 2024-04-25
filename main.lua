local R     = require('core.render')
local P     = require('core.player')
local TM    = require('core.map.tiledmap')
local Game  = require('core.game')
local M     = require('core.math.math')
local V2    = require('core.math.vec2')
local Camera   = require('core.camera.camera')
local Entity = require('core.entity')


map = TM.new('assets/maps/map', 'assets/maps/tiles.png')

cam = Camera.new(300,100, 800,600)
c = 0

local e1 = Entity.new(10,10)
R:add(e1)

function love.load()
    p = P.new(100,100)
    cam:setTarget(p)

end

function love.update(dt)
    P.update(p, dt)

    c = c + 0.01

    e1.position.x = e1.position.x + math.sin(c) * 10

    cam:update(dt)
end

function love.draw()

    love.graphics.setBackgroundColor(0.5,0.5,0.5,1)


    cam:begin()

    R:draw_batch()

    -- GUI BEFORE CAMERA!

    R:draw_sprite(p)

    cam:draw()

    map:draw()

    cam:flush()

end

function love.mousepressed(x, y, button, istouch)
end
