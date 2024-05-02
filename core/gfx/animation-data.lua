local JSON    = require('libs.json')
local Util    = require('core.util')

local AnimationData = {}
AnimationData.__index = AnimationData

function AnimationData.new(json_file)

    local obj = setmetatable({}, AnimationData)
    local str = Util.read_file(json_file)
    obj.frame_data = JSON.decode(str)

    obj.anim_states = obj.frame_data.meta.frameTags

   return obj
end

function AnimationData:get_animation(name)
    for k,v in pairs(self.anim_states) do
        if v.name == name then
            return v
        end
    end
end

return AnimationData
