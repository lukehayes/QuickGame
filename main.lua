local Factory = require('core.object-factory')
local R       = require('core.render')
local P       = require('core.player')
local QT      = require('core.col.quadtree')
local Rect    = require('core.math.rectangle')

mm = Factory:initEntity(10,10)
R:add(mm)

local p = player_init(100,100, 10)
R:add(p)

local rect = Rect:new(0,0,1920,1080)
local qtObj = QT.new(rect)

local rects = {}

local prssed = false

for i=1,100 do
    local rx = love.math.random(10,1920)
    local ry = love.math.random(10,1080)

    local rect = Rect:new(rx,ry, 10,10)
    QT.insert(qtObj,rect)
    table.insert(rects, rect)
end

function love.load()
end

function love.update(dt)
    player_update(p, dt)

    --print("Clear")
    --QT.clear(qtObj)

    for k,v in pairs(rects) do
        v:update(dt)
        --QT.insert(qtObj,v)
        --table.insert(rects, v)
    end
end

function love.draw()
    R:draw_batch()

    for k,rect in pairs(rects) do
        love.graphics.rectangle('line', rect.x, rect.y, rect.width, rect.height)
    end

    QT.draw(qtObj)

end

function love.mousepressed(x, y, button, istouch)
    --local mx,my = love.mouse.getPosition()
    --local rect = Rect:new(mx,my, 1,1)
    --QT.insert(qtObj,rect)
    --table.insert(rects, rect)
    QT.clear(qtObj)
end
