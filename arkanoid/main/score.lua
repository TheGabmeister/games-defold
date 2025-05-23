local M = {}

M.score = 0

function M.add(points)
	M.score = M.score + points
    msg.post("ui#main", "update_score", { value = M.score })
end

function M.reset()
	M.score = 0
end

return M