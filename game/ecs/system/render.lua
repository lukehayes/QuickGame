-- ********************************************
-- Render System
-- ********************************************

function update(components)

    if components == nil then return end

    for k, v in pairs(components.transform) do

        --love.graphics.setColor(
            --v.color.r,
            --v.color.g,
            --v.color.b,
            --v.color.a
        --)

        love.graphics.rectangle(
            "fill",
            v.x,
            v.y,
            v.w,
            v.h
        )

        --love.graphics.setColor(255,255,255,255)
    end

end

return update
