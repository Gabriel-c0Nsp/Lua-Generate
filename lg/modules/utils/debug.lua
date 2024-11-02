local M = {}
function M.show_config_values(config_values)
	print("Config values:")

	for key, value in pairs(config_values) do
		print(key, value)
	end
end
return M
