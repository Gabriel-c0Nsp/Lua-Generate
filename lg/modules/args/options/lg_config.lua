local colors = require("modules.utils.colors")
local config = require("modules.config.config")

local M = {}
--[[
  Example:
    lg c
    lg config
]]
M.show_config = function()
	print(colors.green .. "Your current configuration is:" .. colors.reset)
	os.execute("cat " .. config.lg_root() .. "/lg_config.txt | tail -n +3")
end

--[[
  Example:
    lg config update
    lg config u
    lg c update
    lg c u
]]
M.update_config = function()
	config.update_config()
end
return M
