local config = require("modules.config.config")
local file_exist = require("modules.utils.check_file_exist")
local colors = require("modules.utils.colors")
local validate_input = require("modules.utils.validate_input")
local templates = require("modules.templates.templates")

local M = {}

local config_values = config.get_config_values()

--[[
  Example:
    lg g c <component_name>
    lg generate c <component_name>
    lg g c <component_name> <path>
    lg generate c <component_name> <path>
]]

-- FIXME: It appends the extension to the component name when you provide the extension trough the arguments
M.generate_component = function(component_name, path)
	path = path or "./"

	-- Checks if "component_name" has a custom extension
	local has_custom_extension = component_name:match("%.[%w]+$")
	local full_name = has_custom_extension and component_name or (component_name .. "." .. config_values.extension)

	-- Checks if "path" ends with a slash and, if not, adds one
	if path:sub(-1) ~= "/" then
		path = path .. "/"
	end

	-- Creates the directory, if necessary
	os.execute("mkdir -p " .. path)

	local component

	if config_values.extension == "js" then
		component = templates.component_template(component_name).component_js
	elseif config_values.extension == "jsx" then
		component = templates.component_template(component_name).component_jsx
	elseif config_values.extension == "ts" then
		component = templates.component_template(component_name).component_ts
	elseif config_values.extension == "tsx" then
		component = templates.component_template(component_name).component_tsx
	else
		print(colors.red .. "ERROR: Invalid extension encountered!" .. colors.reset)
		os.exit(1)
	end

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
			io.write("--> ")
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

--[[
  Example:
    lg g p <directory_name>
    lg generate p <directory_name>
    lg g page <directory_name>
    lg generate page <directory_name>
]]
M.generate_page = function(path)
	path = path or "./"

	-- Checks if "path" ends with a slash and, if it has, removes it
	if path:sub(-1) == "/" then
		path = path:sub(1, -2)
	end

	os.execute("mkdir -p " .. path)
	os.execute("touch " .. path .. "/page." .. config_values.extension)

	-- TODO: Add the page template depending on the extension
	local page = [[
  ]]

	local page_file = io.open(path .. "/page." .. config_values.extension, "w")

	if not page_file then
		print("ERROR: Unable to create page file")
		return nil
	end

	page_file:write(page)
	page_file:close()
end

-- FIXME: It appends the extension to the component name when you provide the extension trough the arguments
-- TODO: Create functions to to simplify how svg files are created
--[[
  Example:
    lg g s <file_name>
    lg generate s <file_name>
    lg g svg <file_name>
    lg generate svg <file_name>
    lg g s <file_name> <file_path>
    lg generate s <file_name> <file_path>
    lg g svg <file_name> <file_path>
    lg generate svg <file_name> <file_path>
]]
M.generate_svg = function(svg_name, file_path)
	local has_custom_extension = svg_name:match("%.[%w]+$")
	local full_name = has_custom_extension and svg_name or (svg_name .. "." .. config_values.extension)
	file_path = file_path or nil

	if not file_exist(full_name) then
		if file_path ~= nil and not file_exist(file_path) then
			print(colors.red .. "ERROR: File " .. file_path .. " does not exist!" .. colors.reset)
			local valid_options = { "y", "n" }
			local answer

			repeat
				print("Do you want to create a default SVG file? (Y/n)")
				io.write("--> ")
				answer = io.read()
				answer = answer:lower()

				if answer == "" then
					answer = "y"
				end

				if not validate_input(answer, valid_options) then
					print(colors.red .. "Invalid input. Please try again." .. colors.reset)
				end
			until validate_input(answer, valid_options)

			if answer == "y" then
				print(colors.yellow .. "Creating a default svg file" .. colors.reset)
				local svg_file = io.open(full_name, "w")

				if not svg_file then
					print("ERROR: Unable to create file containing the svg")
					return nil
				end

				local svg

				if config_values.extension == "js" then
					svg = templates.svg_template(svg_name, nil).svg_js
				elseif config_values.extension == "jsx" then
					svg = templates.svg_template(svg_name, nil).svg_jsx
				elseif config_values.extension == "ts" then
					svg = templates.svg_template(svg_name, nil).svg_ts
				elseif config_values.extension == "tsx" then
					svg = templates.svg_template(svg_name, nil).svg_tsx
				else
					print(colors.red .. "ERROR: Invalid extension encountered!" .. colors.reset)
					os.exit(1)
				end

				svg_file:write(svg)
				svg_file:close()
			else
				print(colors.yellow .. "Operation canceled" .. colors.reset)
			end
		elseif file_path ~= nil and file_exist(file_path) then
			local svg_content = io.open(file_path):read("*a"):match("<svg.->(.-)</svg>")
			local svg

			if config_values.extension == "js" then
				svg = templates.svg_template(svg_name, svg_content).svg_js
			elseif config_values.extension == "jsx" then
				svg = templates.svg_template(svg_name, svg_content).svg_jsx
			elseif config_values.extension == "ts" then
				svg = templates.svg_template(svg_name, svg_content).svg_ts
			elseif config_values.extension == "tsx" then
				svg = templates.svg_template(svg_name, svg_content).svg_tsx
			else
				print(colors.red .. "ERROR: Invalid extension encountered!" .. colors.reset)
				os.exit(1)
			end

			local svg_file = io.open(full_name, "w")

			if not svg_file then
				print("ERROR: Unable to create file containing the svg")
				return nil
			end

			svg_file:write(svg)
			svg_file:close()
		else
			local svg

			if config_values.extension == "js" then
				svg = templates.svg_template(svg_name, nil).svg_js
			elseif config_values.extension == "jsx" then
				svg = templates.svg_template(svg_name, nil).svg_jsx
			elseif config_values.extension == "ts" then
				svg = templates.svg_template(svg_name, nil).svg_ts
			elseif config_values.extension == "tsx" then
				svg = templates.svg_template(svg_name, nil).svg_tsx
			else
				print(colors.red .. "ERROR: Invalid extension encountered!" .. colors.reset)
				os.exit(1)
			end

			local svg_file = io.open(full_name, "w")

			if not svg_file then
				print("ERROR: Unable to create file containing the svg")
				return nil
			end

			svg_file:write(svg)
			svg_file:close()
		end
	else
		print(colors.yellow .. "ALERT! File already exists" .. colors.reset)
		local valid_options = { "y", "n" }
		local answer

		repeat
			print("Do you want to overwrite it? (y/N)")
			io.write("--> ")
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
			if file_path ~= nil and not file_exist(file_path) then
				print(colors.red .. "ERROR: File " .. file_path .. " does not exist!" .. colors.reset)

				repeat
					print("Do you want to create a default SVG file? (Y/n)")
					io.write("--> ")
					answer = io.read()
					answer = answer:lower()

					if answer == "" then
						answer = "y"
					end

					if not validate_input(answer, valid_options) then
						print(colors.red .. "Invalid input. Please try again." .. colors.reset)
					end
				until validate_input(answer, valid_options)

				if answer == "y" then
					print(colors.yellow .. "Creating a default svg file" .. colors.reset)
					local svg_file = io.open(full_name, "w")

					if not svg_file then
						print("ERROR: Unable to create file containing the svg")
						return nil
					end

					local svg

					if config_values.extension == "js" then
						svg = templates.svg_template(svg_name, nil).svg_js
					elseif config_values.extension == "jsx" then
						svg = templates.svg_template(svg_name, nil).svg_jsx
					elseif config_values.extension == "ts" then
						svg = templates.svg_template(svg_name, nil).svg_ts
					elseif config_values.extension == "tsx" then
						svg = templates.svg_template(svg_name, nil).svg_tsx
					else
						print(colors.red .. "ERROR: Invalid extension encountered!" .. colors.reset)
						os.exit(1)
					end

					svg_file:write(svg)
					svg_file:close()
				else
					print(colors.yellow .. "Operation canceled" .. colors.reset)
				end
			elseif file_path ~= nil and file_exist(file_path) then
				local svg_content = io.open(file_path):read("*a"):match("<svg.->(.-)</svg>")
				local svg

				if config_values.extension == "js" then
					svg = templates.svg_template(svg_name, svg_content).svg_js
				elseif config_values.extension == "jsx" then
					svg = templates.svg_template(svg_name, svg_content).svg_jsx
				elseif config_values.extension == "ts" then
					svg = templates.svg_template(svg_name, svg_content).svg_ts
				elseif config_values.extension == "tsx" then
					svg = templates.svg_template(svg_name, svg_content).svg_tsx
				else
					print(colors.red .. "ERROR: Invalid extension encountered!" .. colors.reset)
					os.exit(1)
				end

				local svg_file = io.open(full_name, "w")

				if not svg_file then
					print("ERROR: Unable to create file containing the svg")
					return nil
				end

				svg_file:write(svg)
				svg_file:close()
			else
				local svg

				if config_values.extension == "js" then
					svg = templates.svg_template(svg_name, nil).svg_js
				elseif config_values.extension == "jsx" then
					svg = templates.svg_template(svg_name, nil).svg_jsx
				elseif config_values.extension == "ts" then
					svg = templates.svg_template(svg_name, nil).svg_ts
				elseif config_values.extension == "tsx" then
					svg = templates.svg_template(svg_name, nil).svg_tsx
				else
					print(colors.red .. "ERROR: Invalid extension encountered!" .. colors.reset)
					os.exit(1)
				end

				local svg_file = io.open(full_name, "w")

				if not svg_file then
					print("ERROR: Unable to create file containing the svg")
					return nil
				end

				svg_file:write(svg)
				svg_file:close()
			end
		else
			print(colors.yellow .. "Operation canceled" .. colors.reset)
		end
	end
end

return M
