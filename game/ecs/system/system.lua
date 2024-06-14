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
        local spr = components.sprites[i]

        if transform then
            transform.position.x = transform.position.x + transform.dx * transform.speed * dt
            transform.position.y = transform.position.y + transform.dy * transform.speed * dt

            -- Move collision
            if col then
                if spr then
                    col.x = transform.position.x
                    col.y = transform.position.y
                    col.w = transform.w * spr.scale
                    col.h = transform.h * spr.scale
                else
                    if not col.need_scaling then
                        col.x = (transform.position.x + transform.w / 2) - (col.w / 2)
                        col.y = (transform.position.y + transform.h / 2) - (col.h / 2)
                    else
                        col.x = transform.position.x
                        col.y = transform.position.y
                    end
                end
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
