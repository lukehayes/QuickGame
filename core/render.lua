
local Renderer = {
    render_list = {}
}

-- Add an entity to the render list.
function Renderer:add(e)
    table.insert(self.render_list, e)
end

-- Draw everything that has been added to the render list.
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
