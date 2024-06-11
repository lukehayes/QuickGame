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

            transform.x = transform.x + transform.dx * transform.speed * transform.x * dt
            transform.y = transform.y + transform.dy * transform.speed * transform.y * dt

            if transform.x <= 2 or transform.x >= 1270 then
                transform.dx = -transform.dx
            end

            if transform.y <= 10 or transform.y >= 710 then
                transform.dy = -transform.dy
            end

            -- Move collision
            if col then
                col.x = transform.x - (col.w / 2)
                col.y = transform.y - (col.h / 2)
            end
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
