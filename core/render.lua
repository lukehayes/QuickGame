
function draw(entity)

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

return draw
