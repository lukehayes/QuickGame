-----------------------------------------------------------
-- Timer.
-- The Timer class
--
-- @classmod core.math.timer

local Timer = {}
Timer.__index = Timer

function Timer.new(duration, oneshot)
    local obj = setmetatable({}, Timer)

    obj.duration = duration or 1
    obj.oneshot  = oneshot or false
    obj.elapsed  = 0
    obj.running  = true
    obj.finished = false

    return obj
end

function _timerFinished(timer)
    return timer.elapsed >= timer.duration or false
end

function _updateTimer(timer, dt)
    if not timer.finished then
        timer.elapsed = timer.elapsed + dt
    end
end

function Timer:update(dt)

    -- TODO This is working now but needs a lot of work.
    if self.finished and self.running then

        if self.oneshot ~= false then
            self.finished = true
            self.running  = false
        else
            self.finished = false
            self.elapsed  = 0
        end
    else
        _updateTimer(self, dt)

        if self.elapsed >= self.duration then
            self.elapsed = 0
            self.finished = true
        end
    end
end

return Timer
