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

    local y = 1

    for  x = 1, self.width * self.height do

        local quad = self.quads[tilePositions[x]]
        local tile = tilePositions[x]

        if x % 16 == 0 then
            y = y + 1
        end

        if quad then
            love.graphics.draw(self.texture, self.quads[tile], x * 16, y)
        else
            x = x + 16
        end
    end

    y = 0
end

return TiledMap
