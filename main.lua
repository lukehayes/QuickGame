local Factory = require('core.object-factory')
local R       = require('core.render')
local P       = require('core.player')
local QT      = require('core.col.quadtree')
local Rect    = require('core.math.rectangle')

mm = Factory:initEntity(10,10)
R:add(mm)

local p = player_init(100,100, 10)
R:add(p)

local qt = QT:new(Rect:new(0,0,800,600))

local rects = {}

for i=1,130 do
    local rx = love.math.random(10,700)
    local ry = love.math.random(10,600)
    
    local rect = Rect:new(rx,ry, 20,20)

    qt:insert(rect)

    table.insert(rects, rect)
end

function love.load()
end

function love.update(dt)
    player_update(p, dt)
end

function love.draw()
    R:draw_batch()

    for k,rect in pairs(rects) do
        love.graphics.rectangle('line', rect.x, rect.y, rect.width, rect.height)
    end

    qt:draw()

end
