local System = {}
System.__index = {}

-- ----------------------------------------------------------------------------
-- Movement System
-- ----------------------------------------------------------------------------
function System.move(components, dt)

    if components == nil then return end

    for i=1,#components.transform do

        local transform = components.transform[i]
        local col = components.collision[i]

        if transform then
            transform.x = transform.x + transform.dx * transform.speed * dt
            transform.y = transform.y + transform.dy * transform.speed * dt

            -- Move collision
            if col then
                col.x = (transform.x + transform.w / 2) - (col.w / 2)
                col.y = (transform.y + transform.h / 2) - (col.h / 2)
            end
        end

        love.graphics.setColor(255,255,255,255)
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

        if spr then
            love.graphics.draw(spr.image, transform.x, transform.y, 0, spr.scale, spr.scale)

        else
            love.graphics.rectangle(
                'fill',
                transform.x,
                transform.y,
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

        if col then

            if col.x <= 2 or col.x + col.w >= 1280 then
                transform.dx = -transform.dx
            end

            if col.y <= 2 or col.y + col.h >= 720 then
                transform.dy = -transform.dy
            end
        end
    end
end

return System
