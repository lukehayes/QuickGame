local System = {}
System.__index = {}

-- ********************************************
-- Movement System
-- ********************************************
function system_move(components, dt)

    if components == nil then return end

    for i=1,#components.transform do
        print(i)
        print("-----")
    end

    --for k,v in pairs(components) do

        --local transform = v.transform
        --local movement  = v.movement

        --if transform and movement then

            --transform.x = transform.x + movement.dx * movement.x * dt
            --transform.y = transform.y + movement.dy * movement.y * dt

            --if transform.x <= 2 or transform.x >= 760 then
                --movement.dx = -movement.dx
            --end

            --if transform.y <= 10 or transform.y >= 380 then
                --movement.dy = -movement.dy
            --end

        --end

    --end

    love.graphics.setColor(255,255,255,255)
end

-- ********************************************
-- Render System
-- ********************************************
function system_render(transforms)

    if transforms == nil then return end

    for i=1, #transforms do
        local t = transforms[i]

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
