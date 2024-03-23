
function mob_create(x,y, scale)
    scale = scale or 10

    local m = {
        x = x,
        y = y,
        scale = scale,
        vx = 0,
        vy = 0,
        color = {r = 0.5, g = 0.5, b = 0.5, a = 0.5},
        style = 'fill',
        dx = -1,
        dy = 1
    }

    return m
end

return mob_create
