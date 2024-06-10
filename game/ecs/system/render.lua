-- ********************************************
-- Render System
-- ********************************************

function update(transforms)

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

return update
