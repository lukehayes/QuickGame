local M = require("core.math.math")

local System = {}
System.__index = {}

-- ----------------------------------------------------------------------------
-- Movement System
-- ----------------------------------------------------------------------------

function System.move(components, dt)
    for i=1,#components.transform do
        local trn  = components.transform[i]
        local phy  = components.physics[i]

        if trn and phy == nil then
            trn.position.x = trn.position.x + trn.dx * trn.speed * dt
            trn.position.y = trn.position.y + trn.dy * trn.speed * dt
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
                --p.dir.x = love.math.random(-1,1)
                --p.dir.y = love.math.random(-1,1)
                --p.speed = love.math.random(10,100)
                p.acceleration.x = love.math.random(-30,30)
                p.acceleration.y = love.math.random(-30,30)
            end
            
            p.velocity.x = p.velocity.x + p.acceleration.x * dt
            p.velocity.y = p.velocity.y + p.acceleration.y * dt

            local norm = M.norm(p.velocity)
            p.angle = math.atan2(norm.y, norm.x)

            -- TODO Add edge detection for physics bodies.

            t.position.x = t.position.x + p.velocity.x * dt
            t.position.y = t.position.y + p.velocity.y * dt
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
        local phy       = components.physics[i]

        if spr then
            love.graphics.draw(spr.image, transform.position.x, transform.position.y, phy.angle, spr.scale, spr.scale)
        else
            love.graphics.rectangle(
                'fill',
                transform.position.x,
                transform.position.y,
                transform.w,
                transform.h
            )
        end


        -- Render using the physics component data.
        if phy and phy.show_velocity then
            love.graphics.line(
                transform.position.x + transform.w / 2,
                transform.position.y + transform.h / 2,
                30 * math.cos(phy.angle) + transform.position.x + transform.w,
                30 * math.sin(phy.angle) + transform.position.y + transform.h
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

    for i=1,#components.collision do

        local col = components.collision[i]
        local trn = components.transform[i]
        local spr = components.sprites[i]

        col.triggered = false

        -- Move collision box.
        -- If sprite is present then scale is taken into account.
        if col and spr then
            if col.w == spr.size then
                col.x = trn.position.x
                col.y = trn.position.y
            else
                col.x = trn.position.x + (spr.size * spr.scale - col.w)  / 2
                col.y = trn.position.y + (spr.size * spr.scale - col.h)  / 2
            end
        end

        -- Detect a collision width the edge of the screen.
        if col.x <= 2 or col.x + col.w >= 1280 then
            trn.dx  = -trn.dx
            col.triggered = true
        end

        if col.y <= 2 or col.y + col.h >= 720 then
            trn.dy = -trn.dy
            col.triggered = true
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


function System.timer(components, dt)

    for i=1,#components.timers do
        local timer = components.timers[i]

        if timer then
            timer.elapsed = timer.elapsed + dt

            if timer.elapsed >= timer.time then
                timer.finished = true
            end

            local rep = timer.current_repeats ~= timer.repeats
            print(rep, timer.current_repeats, timer.repeats)

            if timer.finished and timer.timeout ~= true then

                local tr = components.transform[i]
                tr.position.x = love.math.random(10,500)
                tr.position.y = love.math.random(10,500)

                timer.timeout = false

                if timer.current_repeats ~= timer.repeats then
                    timer.current_repeats = timer.current_repeats + 1
                    timer.timeout = true
                end
            end
        end


    end
end

return System
