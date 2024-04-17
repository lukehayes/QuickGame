
local M       = require('core.math.math')
local Color   = require 'core.color'
local V2      = require('core.math.vec2')
local Factory = require('core.object-factory')

local Player = {}


function Player.new(x,y, scale)

    local p = setmetatable({}, {__index = Factory:initObject(x,y)})

    p.name  = 'Player'
    p.color = Color.DEBUG
    p.scale = scale or 3

    ----------------
    --  MOVEMENT  --
    ----------------
    p.speed          = 550
    p.velocity       = V2:new(0,0)
    p.acceleration   = V2:new(0,0)
    p.ACC_RATE       = 0.07
    p.SLOW_DOWN_RATE = 0.01
    p.sprite = love.graphics.newImage('assets/spaceship2.png')
    p.sprite:setFilter('nearest', 'nearest')

    p.blur = love.graphics.newImage('assets/spaceship2-blur.png')
    p.blur:setFilter('nearest', 'nearest')

    return p
end

function Player.update(p, dt)
    Player.input(p, dt)
end

function Player.input(p, dt)

    if love.keyboard.isDown('d') then
        p.acceleration.x = M.lerp(p.acceleration.x,p.speed, p.ACC_RATE)
    else
        p.acceleration.x = M.lerp(p.acceleration.x,0 , p.SLOW_DOWN_RATE)
    end

    if love.keyboard.isDown('a') then
        p.acceleration.x = M.lerp(p.acceleration.x,-p.speed, p.ACC_RATE)
    else
        p.acceleration.x = M.lerp(p.acceleration.x,0 , p.SLOW_DOWN_RATE)
    end

    if love.keyboard.isDown('w') then
        p.acceleration.y = M.lerp(p.acceleration.y,-p.speed, p.ACC_RATE)
    else
        p.acceleration.y = M.lerp(p.acceleration.y,0 , p.SLOW_DOWN_RATE)
    end

    if love.keyboard.isDown('s') then
        p.acceleration.y = M.lerp(p.acceleration.y,p.speed, p.ACC_RATE)
    else
        p.acceleration.y = M.lerp(p.acceleration.y,0 , p.SLOW_DOWN_RATE)
    end

    p.position.x = p.position.x + p.acceleration.x * dt
    p.position.y = p.position.y + p.acceleration.y * dt
end

return Player
