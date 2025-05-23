local M = {}

function M.load_highscore()
    local filename = sys.get_save_file("sys_save_load", "highscore")
    local data = sys.load(filename)
    return data.highscore or 0 
end

function M.save_highscore(highscore)
    local filename = sys.get_save_file("my_game", "highscore")
    sys.save(filename, { highscore = highscore })
end

return M