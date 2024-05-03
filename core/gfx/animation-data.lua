---------------------------------------------------------------------------------
-- AnimationData.
--
-- Class deals with specifics of reading JSON files made in Asprite and adding
-- helper method to get information from that file more easily.
--
-- @classmod core.gfx.animation-data
--
local JSON    = require('libs.json')
local Util    = require('core.util')

local AnimationData = {}
AnimationData.__index = AnimationData

------------------------------------------------------------------------
-- Constructor
--
-- @param string json_file    The json file containing animation info.
function AnimationData.new(json_file)

    local obj = setmetatable({}, AnimationData)
    local str = Util.read_file(json_file)
    obj.data = JSON.decode(str)

    obj.anim_states = obj.data.meta.frameTags

   return obj
end

------------------------------------------------------------------------
-- Get specific animation data as a table
--
-- @treturn string    The animation name.
-- @treturn number    The animation start frame.
-- @treturn number    The animation end frame.
function AnimationData:get_animation(name)
    for k,v in pairs(self.anim_states) do
        if v.name == name then
            return v.name, v.from, v.to
        end
    end
end

------------------------------------------------------------------------
-- Get the width of the animation image as it was set in Aseprite.
--
-- The value is width as I amm only using horizontal rows
-- currently and not a full texture atlas.
--
-- @treturn number    The image size (width).
function AnimationData:get_size()
    return self.data.meta.size.w
end

return AnimationData
