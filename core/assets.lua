local Assets = {}

---------------------------------------------------------------------------------
-- Get the path to a particular image.
--
-- @tparam string image    The name of the image file. Only .png format suppoerted.
--
--
-- @treturn String    The full path to the image, nil otherwise.
function Assets.image(image)
    return 'assets/images/' .. image .. '.png'
end

---------------------------------------------------------------------------------
-- Get the path to a particular image.
--
-- @tparam string json    The name of the json file.
--
-- @treturn String    The full path to the json file, nil otherwise.
function Assets.json(json)
    return 'assets/json/' .. json .. '.json'
end


return Assets
