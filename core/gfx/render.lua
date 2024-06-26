---------------------------------------------------------------------------------
-- Renderer.
-- Renderer holds helper functions for all kinds of drawing.
--
-- @classmod core.gfx.renderer
--
local Color = require "core.gfx.color"

local Renderer = {
    render_list = {}
}

---------------------------------------------------------------------------------
-- Add an entity to the render list.
--
-- @tparam Entity e.
--
function Renderer:add(e)
    table.insert(self.render_list, e)
end

---------------------------------------------------------------------------------
-- Draw everything that has been added to the render list.
function Renderer:draw_batch()
    for _, e in pairs(self.render_list) do

        if e.name == 'ColRect' then
            Renderer:draw_collision(e)
        elseif e.name == 'Sprite' then
            Renderer:draw_sprite(e)
        else
            Renderer:draw(e)
        end
    end
end

---------------------------------------------------------------------------------
-- Draw a x by y grid grid.
--
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

---------------------------------------------------------------------------------
-- Draw an actual singular point.
--
-- @param x    number    X postion
-- @param y    number    Y postion
function Renderer:draw_actual_point(x,y,...)
    love.graphics.points(x,y,...)
end

---------------------------------------------------------------------------------
-- Draw a single point.
--
-- @param x    number    X postion
-- @param y    number    Y postion
-- @param number    point_size    The size of the point.
function Renderer:draw_point(x,y,point_size)

    local point_size =  point_size or 1
    love.graphics.rectangle('fill', x,y, point_size, point_size)
end

---------------------------------------------------------------------------------
-- Draw a collision box.
--
-- @param x    number    X postion
-- @param y    number    Y postion
-- @param number    point_size    The size of the point.
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

---------------------------------------------------------------------------------
-- Draw a single entity.
--
-- @tparam Entity entity.
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

---------------------------------------------------------------------------------
-- Draw a single sprite.
--
-- @tparam Sprite sprite.
function Renderer:draw_sprite(sprite)
    love.graphics.draw(sprite.image, sprite.position.x, sprite.position.y, 0, sprite.scale,sprite.scale)
end

---------------------------------------------------------------------------------
-- Clear the screen, optionally with a color.
--
-- @tparam Color color    The clear color.
function Renderer:clear(color)
    color = color or Color.BLACK
    love.graphics.setBackgroundColor(color.r, color.g, color.b, color.a)
end

return Renderer
