local M = require("core.math.math")

local System = {}
System.__index = {}

-- ----------------------------------------------------------------------------
-- Movement System
-- ----------------------------------------------------------------------------
function System.move(components, dt)

    if components == nil then return end

    for i=1,#components.transform do

        local tran  = components.transform[i]
        local col   = components.collision[i]
        local spr   = components.sprites[i]
        local phy   = components.physics[i]

        -- If there is a physics component then use that system instead
        if phy then return end

        if tran then

            tran.position.x = tran.position.x + tran.dx * tran.speed * dt
            tran.position.y = tran.position.y + tran.dy * tran.speed * dt

            -- Move collision
            if col then
                if col.w == spr.size then
                    col.x = tran.position.x
                    col.y = tran.position.y

                else
                    col.x = tran.position.x + (spr.size * spr.scale - col.w)  / 2
                    col.y = tran.position.y + (spr.size * spr.scale - col.h)  / 2
                end

            end
        end
    end
end

-- ----------------------------------------------------------------------------
-- Velocity System
-- ----------------------------------------------------------------------------
function System.physics(components, dt)

    if components == nil then return end

    for i=1,#components.physics do

        local t = components.transform[i]
        local p = components.physics[i]

        -- TODO Make velocity work.
        --
        -- Timer to regenerate movement when slowed to a certain speed
        -- Get the direction of the velocity.
        -- Work out when stopped or very slow.

        if p then

            p.time = p.time + dt

            if p.time >= p.reset_time then

                p.time  = love.math.random(0.2,4)
                p.dir.x = love.math.random(-1,1)
                p.dir.y = love.math.random(-1,1)
                p.speed = love.math.random(2,20)
                p.acceleration.x = love.math.random(-1,1)
                p.acceleration.y = love.math.random(-1,1)
                p.ACC_RATE = love.math.random(0.1, 1.0)

                p.acceleration.x = M.lerp(p.acceleration.x,p.speed, p.ACC_RATE)
                p.acceleration.y = M.lerp(p.acceleration.y,p.speed, p.ACC_RATE)
            end

            p.velocity.x = M.lerp(p.acceleration.x,0 , p.SLOW_DOWN_RATE)
            p.velocity.y = M.lerp(p.acceleration.y,0 , p.SLOW_DOWN_RATE)

            t.position.x = t.position.x + p.dir.x * p.acceleration.x * p.speed * dt
            t.position.y = t.position.y + p.dir.y * p.acceleration.y * p.speed * dt
        end
    end
end
-- ----------------------------------------------------------------------------
-- Render System
-- ----------------------------------------------------------------------------
function System.render(components, draw_collisions)

    if components == nil then return end

    for i=1, #components.transform do

        local transform = components.transform[i]
        local col       = components.collision[i]
        local spr       = components.sprites[i]
        local p         = components.physics[i]

        if spr then
            love.graphics.draw(spr.image, transform.position.x, transform.position.y, 0, spr.scale, spr.scale)
        else
            love.graphics.rectangle(
                'fill',
                transform.position.x,
                transform.position.y,
                transform.w,
                transform.h
            )
        end


        -- Draw collision shapes on top of entity.
        if col and draw_collisions then
            love.graphics.setColor(
                col.color.r,
                col.color.g,
                col.color.b,
                col.color.a
            )

            love.graphics.rectangle(
                'fill',
                col.x,
                col.y,
                col.w,
                col.h
            )
            love.graphics.setColor(1,1,1,1)
        end
        

    end
end

-- ----------------------------------------------------------------------------
-- Collision System
-- ----------------------------------------------------------------------------
function System.collision(components)

    if components == nil then return end

    for i=1,#components.transform do

        local col = components.collision[i]
        local transform = components.transform[i]
        local p = components.physics[i]

        col.triggered = false

        -- TODO Add movement if there is a physics component
        if p then

            if col.x <= 2 or col.x + col.w >= 1280 then
                transform.dx = -transform.dx
                p.dir.x = -p.dir.x
                col.triggered = true
            end

            if col.y <= 2 or col.y + col.h >= 720 then
                transform.dy = -transform.dy
                p.dir.y = -p.dir.y
                col.triggered = true
            end
        end
    end
end

-- ----------------------------------------------------------------------------
-- Collision System for colliding with other entities.
-- ----------------------------------------------------------------------------
function System.collisionWithEntities(components)

    if components == nil then return end

    for i=1,#components.transform do

        local col = components.collision[i]
        local transform = components.transform[i]

        if col then

            for _,comp in pairs(components.collision) do

                if col ~= comp then
                    if M.aabb(col.x, col.y, col.w, col.h,
                        comp.x, comp.y, comp.w,comp.h
                        ) then

                        transform.dx = -transform.dx
                        transform.dy = -transform.dy
                    end
                end
            end
        end
    end
end

return System
