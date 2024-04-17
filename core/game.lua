local Game = {}

Game.states = {
    "Playing",
    "Paused",
    "PlayerWin",
    "PlayerLose"
}

Game.width, Game.height = love.window.getMode()

return Game
