local colors = require("modules.utils.colors")
local config = require("modules.config")


local M = {}

--[[
  Example:
    lg c
    lg config
]]
function M.show_config()
  print(colors.yellow .. "Your current configuration is:" .. colors.reset)
	os.execute("cat config.txt | tail -n +2")
end

--[[
  Example:
    lg config update
    lg config u
    lg c update
    lg c u
]]
function M.update_config()
  local config_file = config.open_config()
  config.update_config(config_file)
end
return M
