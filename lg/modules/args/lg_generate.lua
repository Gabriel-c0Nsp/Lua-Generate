local config = require("modules.config")

local M = {}
function M.generate_component(name, path)
	-- TODO: get extension value
	-- TODO: open file with extension value
	-- TODO: write to file using component template (and component name)
	-- TODO: close file

	local config_file = config.open_config()
	local config_values = config.get_config_values(config_file)

	config.close_config(config_file)
end

return M
