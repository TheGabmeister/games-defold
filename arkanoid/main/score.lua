local M = {}
local save_load = require "main.sys_save_load"

M.score = 0
M.hi_score = 0

function M.add(points)
	M.score = M.score + points
	msg.post("ui#main", "update_score", { value = M.score })
	
	if M.score > M.hi_score then
		M.hi_score = M.score
		msg.post("ui#main", "update_hi_score", { value = M.hi_score })
		save_load.save_highscore(M.hi_score)
	end
end

function M.reset()
	M.score = 0
end

return M