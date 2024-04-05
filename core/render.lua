local Color = require "core.color"

local Renderer = {
    render_list = {}
}

--- Add an entity to the render list.
function Renderer:add(e)
    table.insert(self.render_list, e)
end

--- Draw everything that has been added to the render list.
function Renderer:draw_batch()
    for _, e in pairs(self.render_list) do

        love.graphics.setColor(
            e.color.r,
            e.color.g,
            e.color.b,
            e.color.a
        )

        love.graphics.rectangle(
            'fill',
            e.x,
            e.y,
            e.scale,
            e.scale
        )

        love.graphics.setColor(1,1,1,1)
    end
end

--- Draw a x by y grid grid.
---
-- @param xp    number    X postion
-- @param yp    number    Y postion
-- @param w     number    Width of grid
-- @param h     number    Height of grid
-- @param scale number    Size of each cell
-- @param color Color     Color of grid.
function Renderer.draw_grid(xp,yp, w, h, scale, color)

    local color = color or Color.WHITE
    local scale = scale or 16
    local xp = xp or 0
    local yp = yp or 0

    love.graphics.setColor(color.r, color.g, color.b, color.a * 0.5)

    for xx=0,w do
        for yy=0,h do
            SPACE = 1
            x = xp + xx * scale * SPACE
            y = yp + yy * scale * SPACE
            love.graphics.rectangle('line', x,y, scale, scale)
        end
    end
end

-- Draw a single entity
function Renderer.draw(entity)

    love.graphics.setColor(
        entity.color.r,
        entity.color.g,
        entity.color.b,
        entity.color.a
    )

    love.graphics.rectangle(
        entity.style,
        entity.x,
        entity.y,
        entity.scale,
        entity.scale
    )

    love.graphics.setColor(1,1,0,1)

end

return Renderer
