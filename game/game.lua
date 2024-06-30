local Game = {
    player_shots = {},
    player_fire_counter = 0,
    player_fire_rate    = 0.5,
    player_can_shoot    = false,
}

function game_add_player_bullet(g, b)
    table.insert(g.player_shots, b)
end


return Game
