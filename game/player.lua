local Game   = require('game.game')
local Bullet = require('game.bullet')

local PlayerUtil = {}

function PlayerUtil.player_shoot(p)

    if love.keyboard.isDown('space') then

        local b = Bullet.new(
            p.position.x,
            p.position.y
        )

        game_add_player_bullet(Game, b)
    end
end

return PlayerUtil


