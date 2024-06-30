local Game   = require('game.game')
local Bullet = require('game.bullet')

local PlayerUtil = {}


function PlayerUtil.player_shoot(p,dt)

    Game.player_fire_counter = Game.player_fire_counter + dt

    if Game.player_fire_counter >= Game.player_fire_rate then
        Game.player_can_shoot = true
        Game.player_fire_counter = 0
    end

    if love.keyboard.isDown('space') then

        if Game.player_can_shoot then
            local b = Bullet.new(
                p.position.x,
                p.position.y
            )

            game_add_player_bullet(Game, b)
        end

        Game.player_can_shoot = false

    end
end

return PlayerUtil


