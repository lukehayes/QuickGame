-- ********************************************
-- Movement System
-- ********************************************



function update(entities, dt)
	if entities == nil then return end

	for k,v in pairs(entities) do

		local transform = v.transform
		local movement = v.movement

		if transform and movement then

			transform.x = transform.x + movement.dx * movement.x * dt
			transform.y = transform.y + movement.dy * movement.y * dt

			if transform.x <= 2 or transform.x >= 760 then
				movement.dx = -movement.dx
			end

			if transform.y <= 10 or transform.y >= 380 then
				movement.dy = -movement.dy
			end

		end

	end

		love.graphics.setColor(255,255,255,255)
end

return update
