local Assets = {}

---------------------------------------------------------------------------------
-- Get the path to a particular image.
--
-- @tparam string image    The name of the image file. Only .png format suppoerted.
--
--
-- @treturn String    The full path to the image, nil otherwise.
function Assets.get_image(image)
    return 'assets/images/' .. image .. '.png'
end


return Assets
