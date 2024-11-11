local M = {}

M.show_config_values = function(config_values)
	print("Config values:\n")

	for key, value in pairs(config_values) do
		print(key .. " = " .. value)
	end
end

M.display_args = function(args)
	for index, arg in pairs(args) do
		if index ~= 0 and index ~= -1 then
			print("arg[" .. index .. "] = " .. arg)
		end
	end
end

return M
