local SpriteFactory = {}

SpriteFactory.spaceship = love.graphics.newImage('assets/spaceship.png')
SpriteFactory.spaceship:setFilter('nearest', 'nearest')

SpriteFactory.spaceship_blur = love.graphics.newImage('assets/spaceship-blur.png')
SpriteFactory.spaceship:setFilter('nearest', 'nearest')

SpriteFactory.pico_man = love.graphics.newImage('assets/Pico8-Man.png')
SpriteFactory.pico_man:setFilter('nearest', 'nearest')

return SpriteFactory
