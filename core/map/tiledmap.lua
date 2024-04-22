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
function TiledMap:draw(xp,yp)

    local xp = xp or 0
    local yp = yp or 0
    local tilePositions = self.map.layers[1].data
    local MAX_TILES = self.width * self.height

    local x = 1
    local y = 1

    while x <= MAX_TILES do

        local tile = tilePositions[x]
        local quad = self.quads[tile]

        xx = x % 16 * (self.tilewidth)

        print(x, "Mod X % 16", x % 16, MAX_TILES)

        if quad then
            love.graphics.draw(self.texture, quad,  xp + xx, yp + yy )
        end

        if x % self.tilewidth == 0 then
            print(x)
            y = y + 1
        end

        x = x + 1

        --print("X:",x,"Y:",y, "Mod X", x % 16, "Mod Y", y % 16)

    end

    print()

    --io.write("-----------------------------")
    --io.write("\n")
end

return TiledMap
