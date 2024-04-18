local TiledMap = {}
TiledMap.__index = TiledMap

function TiledMap.new(map, tile_image)
    local obj = setmetatable({}, TiledMap)

    obj.map = require(map)
    obj.tiles = love.graphics.newImage(tile_image)
    obj.width = obj.map.width
    obj.height = obj.map.height
    obj.quads = {
        love.graphics.newQuad(0, 0, 16,16, 1,1),
        love.graphics.newQuad(16,0, 16,16, 1,1),
        love.graphics.newQuad(32,0, 16,16, 1,1)
    }

    return obj
end

function TiledMap:draw()
    local tilePositions = self.map.layers[1].data

    print("-------")
    local y = 0
    for  x = 1, self.width * self.height do
        if x % self.width == 0 then
            y = y + 1
            local tile = tilePositions[x]
            print("Tile", tile, "X",x)

            --love.graphics.draw(self.tiles, self.quads[1], x,y)
        end
        

    end

    y = 0
end

return TiledMap
