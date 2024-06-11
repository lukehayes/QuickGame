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

            if col then

                if col.x <= 2 or col.x + col.w >= 1280 then
                    transform.dx = -transform.dx
                end

                if col.y <= 2 or col.y + col.h >= 720 then
                    transform.dy = -transform.dy
                end
            end
        end

            transform.x = transform.x + transform.dx * transform.speed * dt
            transform.y = transform.y + transform.dy * transform.speed * dt

            -- Move collision
            if col then
                col.x = transform.x - (col.w / 2)
                col.y = transform.y - (col.h / 2)
            end

        love.graphics.setColor(255,255,255,255)

    end
end

-- ----------------------------------------------------------------------------
-- Render System
-- ----------------------------------------------------------------------------
function System.render(components)

    if components == nil then return end

    for i=1, #components.transform do
        local t = components.transform[i]
        local col = components.collision[i]

        if col then
            print("Collision", i)
            love.graphics.setColor(0.5,0, 0.5,0.8)

            love.graphics.rectangle(
                'fill',
                col.x,
                col.y,
                col.w,
                col.h
            )
            love.graphics.setColor(1,1,1,1)
        end

        love.graphics.rectangle(
            'fill',
            t.x,
            t.y,
            t.w,
            t.h
        )

    end
end

return System
