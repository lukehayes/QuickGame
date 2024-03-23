
local M = require('libs.math')

function player_init(x,y, scale)

    scale = scale or 10

    local p = {
        x = x,
        y = y,
        scale = scale,
        vx = 0,
        vy = 0,
        color = {r = 0.5, g = 0.5, b = 0.5, a = 0.5},
        style = 'fill'
    }

    ----------------
    --  MOVEMENT  --
    ----------------
    p.speed = 500
    p._ax = 0
    p._ay = 0
    p.ACC_RATE = 0.5
    p.SLOW_DOWN_RATE = 0.15

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

    p.x = p.x + p._ax * dt
    p.y = p.y + p._ay * dt
end

return player_init, player_update
