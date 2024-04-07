local M = {}

-- Returns the distance between two points.
function M.distance(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end

-- Returns the angle between two points.
function M.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end

-- Move an entity towards a particular target.
function M.move_towards(entity_a, entity_b, dt, threshold)

    local angle = M.angle(entity_a.x, entity_a.y, entity_b.x, entity_b.y)
    local dist  = M.distance(entity_a.x, entity_a.y, entity_b.x, entity_b.y)
    
    -- Distance to target threshold when movement should stop.
    local threshold = threshold or 5

    if dist > threshold then
        entity_a.x = entity_a.x + math.cos(angle) * entity_a.speed * dt
        entity_a.y = entity_a.y + math.sin(angle) * entity_a.speed * dt
    else
        entity_a.x = entity_a.x
        entity_a.y = entity_a.y
    end
end

return M
