local Color = require "core.color"

local Renderer = {
    render_list = {}
}
c = 0

--- Add an entity to the render list.
function Renderer:add(e)
    table.insert(self.render_list, e)
end

--- Draw everything that has been added to the render list.
function Renderer:draw_batch()
    for _, e in pairs(self.render_list) do

        if e.name == 'ColRect' then
            Renderer:draw_collision(e)
        else
            Renderer:draw(e)
        end
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
function Renderer:draw_grid(xp,yp, w, h, scale, color)

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

--- Draw an actual singular point.
--
-- @param x    number    X postion
-- @param y    number    Y postion
function Renderer:draw_actual_point(x,y,...)
    love.graphics.points(x,y,...)
end

--- Draw a single pont,
function Renderer:draw_point(x,y,point_size)

    local point_size =  point_size or 1
    love.graphics.rectangle('fill', x,y, point_size, point_size)
end

function Renderer:draw_collision(collision)

    love.graphics.setColor(
        collision.color.r,
        collision.color.g,
        collision.color.b,
        collision.color.a
    )

    love.graphics.rectangle(
        'line',
        collision.position.x,
        collision.position.y,
        collision.scale,
        collision.scale
    )

    love.graphics.setColor(1,1,1,1)
end

-- Draw a single entity
function Renderer:draw(entity)

    love.graphics.setColor(
        entity.color.r,
        entity.color.g,
        entity.color.b,
        entity.color.a
    )

    love.graphics.rectangle(
        'fill',
        entity.position.x,
        entity.position.y,
        entity.scale,
        entity.scale
    )

    love.graphics.setColor(1,1,1,1)

end

function Renderer:draw_sprite(entity)
    love.graphics.draw(entity.sprite, entity.position.x, entity.position.y, 0, entity.scale,entity.scale)
end

return Renderer
