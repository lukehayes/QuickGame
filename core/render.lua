
function draw(entity)
    love.graphics.rectangle(
        entity.style,
        entity.x,
        entity.y,
        entity.scale,
        entity.scale
    )
end

return draw
