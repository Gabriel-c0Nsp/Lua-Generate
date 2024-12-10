local colors = require("modules.utils.colors")

local M = {}

M.critical_errors = function()
	local messages = {
		["invalid_arguments"] = function()
			print(colors.red .. "Invalid arguments!" .. colors.reset)
			print("You can try: lg --help for more information")
			os.exit(1)
		end,
		["invalid_extension"] = function()
			print(colors.red .. "ERROR: Invalid extension encountered on your configs!" .. colors.reset)
			os.exit(1)
		end,
		["too_many_args"] = function()
			print(colors.red .. "Too many arguments!" .. colors.reset)
			print("You can try: lg --help for more information")
			os.exit(1)
		end,
		["two_paths_provided"] = function(adicional_information)
			if adicional_information then
				print(
					colors.red
						.. "You provided two paths "
						.. adicional_information
						.. "! This is not allowed."
						.. colors.reset
				)
			else
				print(colors.red .. "You provided two paths! This is not allowed." .. colors.reset)
			end
			print("You can try: lg --help for more information")
			os.exit(1)
		end,
    ["invalid_function_name"] = function (function_name)
      print(colors.red .. "ERROR: You need to provide a valid " .. function_name .. "!" .. colors.reset)
			print("You can try: lg --help for more information")
      os.exit(1)
    end,
	}
	return messages
end

M.errors = function()
	local messages = {
		["unable_to_create"] = function(target_file)
			print(colors.red .. "ERROR: Unable to create " .. target_file .. colors.reset)
		end,
	}
	return messages
end

return M
