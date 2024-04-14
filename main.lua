local Factory = require('core.object-factory')
local R       = require('core.render')
local P       = require('core.player')
local V2      = require('core.math.vec2')
local CR      = require('core.col.collision-rect')

mm = Factory:initMegaMob(10,10)

R:add(mm)

local p = player_init(100,100, 10)
R:add(p)

local a = CR:new(300,400, 100)
local b = CR:new(420,200, 200)

function love.load()
end

function love.update(dt)
    player_update(p, dt)

    a.position.x = p.x
    a.position.y = p.y

    if a:overlaps(b) then
        print("Overlap")
    end

    if a:inside(b) then
        print("Inside")
    end

end

function love.draw()
    R:draw_batch()

    love.graphics.rectangle('line', a.position.x, a.position.y, a.scale, a.scale)
    love.graphics.rectangle('line', b.position.x, b.position.y, b.scale, b.scale)
end
