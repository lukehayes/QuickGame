-----------------------------------------------------------
-- Game.
-- Acts as a single location for helpful information that
-- is useful globally.
--
-- @classmod core.game
local Game = {}


-----------------------------------------------------------
-- @field Playing     The playing state.
-- @field Paused      The paused state.
-- @field PlayerWin   The player win state.
-- @field PlayerLose  The player lose state.
-- @table states
Game.states = {
    "Playing",
    "Paused",
    "PlayerWin",
    "PlayerLose"
}

-----------------------------------------------------------
-- Game width and height values
--
-- @treturn number    The width of the game.
-- @treturn number    The height of the game.
Game.width, Game.height = love.window.getMode()

return Game
