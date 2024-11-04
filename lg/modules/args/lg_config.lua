local colors = require("modules.utils.colors")

local M = {}

--[[
  stands for args:
    config;
    c;
]]
function M.show_config()
  print(colors.yellow .. "Your current configuration is:" .. colors.reset)
	os.execute("cat config.txt | tail -n +2")
end

return M
