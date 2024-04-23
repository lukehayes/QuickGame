----------------------------------------
-- TiledMap Renderer.
-- Class that can draw a tilemap made inside the Tiled map editor.
--
-- @usage
--
-- local TM = require('core.map.tiledmap')
-- local map = TM:new('assets/maps/map.png', 'assets/maps/tiles.png')
--
-- @classmod core.map.tiledmap
--
local TiledMap = {}
TiledMap.__index = TiledMap

----------------------------------------
-- Create a new instance of TiledMap.
--
-- @tparam string map           The full path to the '.lua' map file.
-- @tparam string tile_image    The full path to the '.png' image file.
-- @tparam number tilesize    The size of each tile. Defaults to 16.
--
-- @treturn table A new instance of a tilemap.
function TiledMap.new(map, tile_image, tilesize)
    local obj = setmetatable({}, TiledMap)

    obj.map        = require(map)
    obj.texture    = love.graphics.newImage(tile_image)
    obj.width      = obj.map.width
    obj.height     = obj.map.height
    obj.tilewidth  = obj.map.tilewidth
    obj.tileheight = obj.map.tileheight
    obj.tilesize   = tilesize or 16
    obj.scale = 1

    obj.quads = {
        love.graphics.newQuad(0,  0, obj.tilewidth, obj.tileheight, obj.texture),
        love.graphics.newQuad(16, 0, obj.tilewidth, obj.tileheight, obj.texture),
        love.graphics.newQuad(32, 0, obj.tilewidth, obj.tileheight, obj.texture)
    }

    return obj
end

----------------------------------------
-- Draw the tilemap.
--
-- @tparam number xp    The x position of the tilemap.
-- @tparam number yp    The y position of the tilemap.
--
function TiledMap:draw(xp,yp)

    local xp = xp or 0
    local yp = yp or 0

    local tilePositions = self.map.layers[2].data
    local MAX_TILES = self.width * self.height - 1

    local x = 1
    local y = 1

    while x <= MAX_TILES do
 
        local tile = tilePositions[x]
        local quad = self.quads[tile]

        local _mod = function(n)
            local calc = n % self.tilesize

            if calc < 1 then
                return 16
            else
                return calc
            end
        end

        local xx = _mod(x) * self.tilesize
        local yy = y * self.tilesize

        if quad then
            love.graphics.draw(self.texture, quad,  xp + xx, yp + yy )
        end

        if x % self.tilesize == 0 then
            y = y + 1
        end

        x = x + 1

    end
end

return TiledMap
