local M = {}

local function get_save_path()
    local app_path = sys.get_application_path()
    -- Remove trailing slash if present
    if app_path:sub(-1) == "/" or app_path:sub(-1) == "\\" then
        app_path = app_path:sub(1, -2)
    end
    -- Use OS-specific separator
    local sep = package.config:sub(1,1)
    return app_path .. sep .. "highscore.save"
end

function M.load_highscore()
    local filename = sys.get_save_file("sys_save_load", "highscore")
    local data = sys.load(filename)
    return data.highscore or 0 
end

function M.save_highscore(highscore)
    local filename = sys.get_save_file("sys_save_load", "highscore")
    sys.save(filename, { highscore = highscore })
end

return M