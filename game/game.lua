local Game = {
    player_shots = {}
}

function game_add_player_bullet(g, b)
    table.insert(g.player_shots, b)
end


return Game
