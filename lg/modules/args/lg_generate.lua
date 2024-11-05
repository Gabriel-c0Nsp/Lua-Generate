local config = require("modules.config")
local file_exist = require("modules.utils.check_file_exist")
local colors = require("modules.utils.colors")
local validate_input = require("modules.utils.validate_input")

local M = {}
--[[
  Example:
    lg g <name>
    lg generate <name>
    lg g <name> <path>
    lg generate <name> <path>
]]
function M.generate_component(name, path)
	local config_file = config.open_config()
	local config_values = config.get_config_values(config_file)
	config.close_config(config_file)

	path = path or "./"

	-- Checks if "name" has a custom extension
	local has_custom_extension = name:match("%.[%w]+$")
	local full_name = has_custom_extension and name or (name .. "." .. config_values.extension)

	-- Checks if "path" ends with a slash and, if not, adds one
	if path:sub(-1) ~= "/" then
		path = path .. "/"
	end

	-- Creates the directory, if necessary
	os.execute("mkdir -p " .. path)

	-- TODO: Add the component template depending on the extension
	local component = [[
  ]]

	if not file_exist(full_name) then
		local component_file = io.open(path .. "/" .. full_name, "w")
		if not component_file then
			print("ERROR: Unable to create component file")
			return nil
		end

		component_file:write(component)
		component_file:close()
	else
		print(colors.yellow .. "ALERT! File already exists" .. colors.reset)
		local valid_options = { "y", "n" }
		local answer

		repeat
			print("Do you want to overwrite it? (y/N)")
			answer = io.read()
			answer = answer:lower()

			if answer == "" then
				answer = "n"
			end

			if not validate_input(answer, valid_options) then
				print(colors.red .. "Invalid input. Please try again." .. colors.reset)
			end
		until validate_input(answer, valid_options)

		if answer == "y" then
			local component_file = io.open(path .. "/" .. full_name, "w")

			if not component_file then
				print("ERROR: Unable to create component file")
				return nil
			end

			component_file:write(component)
			component_file:close()
		else
			print(colors.yellow .. "Operation canceled" .. colors.reset)
		end
	end
end
return M
