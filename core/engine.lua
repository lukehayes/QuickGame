-----------------------------------------------------------
-- Engine.
--
-- Table contains system information the game might use.
--
-- @classmod core.engine
local Engine = {}

-----------------------------------------------------------
-- @field Playing     The playing state.
-- @field Paused      The paused state.
-- @field PlayerWin   The player win state.
-- @field PlayerLose  The player lose state.
-- @table states
--Game.states = {
    --"Playing",
    --"Paused",
    --"PlayerWin",
    --"PlayerLose"
--}

-----------------------------------------------------------
-- Game width and height values
--
-- @treturn number    The width of the game.
-- @treturn number    The height of the game.
Engine.width, Engine.height = love.window.getMode()

-----------------------------------------------------------
-- Current Engine Version
Engine.version = 0.01

return Engine
