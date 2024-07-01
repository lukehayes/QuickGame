local Game = {

    -- Engine specifc properties.
    --
    delta = 99999999,
    width = 1280,
    height = 720,

    cursor = love.mouse.newCursor("assets/images/cursor.png", 0, 0),

    -- Game specifc properties.
    --
    player_shots = {},
    mobs         = {},

    player_fire_counter = 0,
    player_fire_rate    = 0.5,
    player_can_shoot    = false,

    mob_gen_counter  = 0,
    mob_gen_rate     = 1,
    mob_can_generate = false
}

function game_add_player_bullet(g, b)
    table.insert(g.player_shots, b)
end

function game_add_mob(g, m)
    table.insert(g.mobs, m)
end


return Game
