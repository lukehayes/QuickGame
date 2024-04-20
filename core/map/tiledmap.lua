local TiledMap = {}
TiledMap.__index = TiledMap

function TiledMap.new(map, tile_image)
    local obj = setmetatable({}, TiledMap)

    obj.map        = require(map)
    obj.texture    = love.graphics.newImage(tile_image)
    obj.width      = obj.map.width
    obj.height     = obj.map.height
    obj.tilewidth  = obj.map.tilewidth
    obj.tileheight = obj.map.tileheight
    obj.scale = 1

    --obj.quads = {
        --love.graphics.newQuad(0, 0, obj.tilewidth, obj.tileheight, obj.scale, obj.scale),
        --love.graphics.newQuad(16,0, obj.tilewidth, obj.tileheight, obj.scale, obj.scale),
        --love.graphics.newQuad(32,0, obj.tilewidth, obj.tileheight, obj.scale, obj.scale)
    --}

    obj.quads = {
        love.graphics.newQuad(0,  0, obj.tilewidth, obj.tileheight, obj.texture),
        love.graphics.newQuad(16, 0, obj.tilewidth, obj.tileheight, obj.texture),
        love.graphics.newQuad(32, 0, obj.tilewidth, obj.tileheight, obj.texture)
    }

    return obj
end

function TiledMap:draw()
    local tilePositions = self.map.layers[1].data

    local x = 1
    local y = 1

    local xc = 0
    local yc = 0

    while  xc <= self.width * self.height do
        xc = xc + 1
        --yc = yc + 1

        local tile = tilePositions[xc]
        local quad = self.quads[tile]

        if quad then
            love.graphics.draw(self.texture, quad, y * 16, x * 16)
        else
            --love.graphics.setColor(1,0,0,0.2)
            --love.graphics.rectangle('fill', x * 16, y * 16, 16,16)
            --love.graphics.setColor(1,1,1,1)
        end

        if xc % 16 == 0 then
            x = x + 1

            if x == 16 then
                x = 1
            end
        end

        if yc % 16 == 0 then
            y = y + 1

            if y == 16 then
                y = 1
            end
        end
    end


end

return TiledMap
