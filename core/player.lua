
local M     = require('libs.math')
local Color = require 'core.color'
local V2    = require('core.math.vec2')

function player_init(x,y, scale)

    scale = scale or 10

    local p = {
        position = V2:new(x,y),
        scale = scale,
        vx = 0,
        vy = 0,
        color = Color.DEBUG,
        style = 'fill'
    }

    ----------------
    --  MOVEMENT  --
    ----------------
    p.speed = 250
    p._ax = 0
    p._ay = 0
    p.ACC_RATE = 0.07
    p.SLOW_DOWN_RATE = 0.01

    return p
end

function player_update(p, dt)
    player_input(p, dt)
end


function player_input(p, dt)

    if love.keyboard.isDown('d') then
        p._ax = M.lerp(p._ax,p.speed, p.ACC_RATE)
    else
        p._ax = M.lerp(p._ax,0 , p.SLOW_DOWN_RATE)
    end

    if love.keyboard.isDown('a') then
        p._ax = M.lerp(p._ax,-p.speed, p.ACC_RATE)
    else
        p._ax = M.lerp(p._ax,0 , p.SLOW_DOWN_RATE)
    end

    if love.keyboard.isDown('w') then
        p._ay = M.lerp(p._ay,-p.speed, p.ACC_RATE)
    else
        p._ay = M.lerp(p._ay,0 , p.SLOW_DOWN_RATE)
    end

    if love.keyboard.isDown('s') then
        p._ay = M.lerp(p._ay,p.speed, p.ACC_RATE)
    else
        p._ay = M.lerp(p._ay,0 , p.SLOW_DOWN_RATE)
    end

    p.position.x = p.position.x + p._ax * dt
    p.position.y = p.position.y + p._ay * dt
end

return player_init, player_update
