-- ********************************************
-- Render System
-- ********************************************

function update(entities)
	if entities == nil then return end

	print(entities)

		love.graphics.setColor(255,255,255,255)
	for k,v in pairs(entities) do

		love.graphics.setColor(
			v.color.r,
			v.color.g,
			v.color.b,
			v.color.a
		)

		love.graphics.rectangle(
			"fill",
			v.transform.x,
			v.transform.y,
			v.transform.w,
			v.transform.h
		)
		love.graphics.setColor(255,255,255,255)
	end
	love.graphics.setColor(255,255,255,255)

end

return update
