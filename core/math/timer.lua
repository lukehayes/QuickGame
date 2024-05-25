-----------------------------------------------------------
-- Timer.
-- The Timer class
--
-- @classmod core.math.timer

local Timer = {}
Timer.__index = Timer

function Timer.new(duration, oneshot)
    local obj = setmetatable({}, Timer)

    obj.duration =  duration or 1
    obj.oneshot  = oneshot or false
    obj.elapsed  = 0
    obj.finished = false

    return obj
end

function _updateTimer(timer, dt)
    if not timer.finished then
        timer.elapsed = timer.elapsed + dt
    end
end

function Timer:update(dt)
    print("Elap: ", self.elapsed, "Fin?", self.finished)

    -- TODO Implement timer fully.

    if (not self.finished) then
        _updateTimer(self, dt)

        if (self.elapsed >= self.duration) then
            self.finished = true
        end
    end


    --if(self.elapsed >= self.duration) then
        --self.elapsed = 0
        --self.finished = true

        --if self.oneshot then
            --self.elapsed = 0
            --self.finished = true
        --else
            --self.elapsed = 0
            --self.finished = true
            --_updateTimer(self, dt)
        --end
    --end
end

return Timer
