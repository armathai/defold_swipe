local M = {}

function M.distance_between_points(pt1, pt2)
	return math.sqrt((pt1.x - pt2.x)^2 + (pt1.y - pt2.y)^2)
end

function M.normalize_angle(angle)
	return angle - math.pi * 2 * math.floor(angle / (math.pi * 2))
end

function M.angle_between_points(pt1, pt2)
	return M.normalize_angle(math.atan2(pt2.y - pt1.y, pt2.x - pt1.x))
end

function M.direction_from_angle(angle)
	local na = (angle + math.pi * 0.25) % (2 * math.pi)

	if na >= 0 and na < math.pi * 0.5 then
		return "right"

	elseif na >= math.pi * 0.5 and na < math.pi then
		return "up"

	elseif na >= math.pi and na < math.pi * 1.5 then
		return "left"

	elseif na >= math.pi * 1.5 and na < math.pi * 2 then
		return "down"
	end
end

function M.get_swipe_direction(pt1, pt2)
	local angle = M.angle_between_points(pt1, pt2);
	local direction = M.direction_from_angle(angle);

	return direction
end

return M
