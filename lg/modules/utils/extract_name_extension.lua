local config = require("modules.config.config")
local error_messages = require("modules.utils.output_logs")

local function extract_name_extension(function_name)
	local config_values = config.get_config_values()

	if config_values == nil then
		error_messages.critical_errors()["no_config_file"]()
		return
	end

	-- Checks if "component_name" has a custom extension
	local has_custom_extension = function_name:match("%.[%w]+$")
	local full_name = has_custom_extension and function_name or (function_name .. "." .. config_values.extension)

	-- subtract the extension from the component name
	function_name = function_name:match("(.+)%..+") or function_name

  return function_name, full_name
end

return extract_name_extension
