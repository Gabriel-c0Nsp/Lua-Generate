local colors = require("modules.utils.colors")
local validate_input = require("modules.utils.validate_input")
local default_config_values = require("modules.config.default_config_values")

local M = {}

-- TODO: the user should be able to decide where to initialize the config file
M.generate_config = function(path)
	local config = io.open(path .."/lg_config.txt", "r")

	if not config then
		config = io.open(path .."/lg_config.txt", "w")

		if not config then
			print("ERROR: Unable to create config file")
			return nil
		end

		config:write("*** THIS FILE IS AUTOGENERATED. DO NOT EDIT. ***\n")
    config:write('root = "' .. path .. '"\n')
		config:write('extension = "default"\n')
		config:write('style = "default"\n')
		config:close()
	end
end

M.init = function()
	lg_root = os.getenv("PWD")

  M.generate_config(lg_root)
end

local function check_valid_config()
	local config_file = io.open("lg_config.txt", "r")

	if config_file then
		local config_file_content = config_file:read("*all")

		config_file:close()
		if config_file_content:match('extension%s*=%s*"(.-)"') and config_file_content:match('style%s*=%s*"(.-)"') then
			return true
		end
		return false
	else
		M.generate_config()
	end
end

M.get_config_values = function()
	local config_values = {
		extension = default_config_values.extension,
		style = default_config_values.style,
	}

	local valid_extensions = { "js", "jsx", "ts", "tsx", "default" }
	local valid_styles = { "CSS", "tailwind", "default" }

	local valid_extension = false
	local valid_style = false

	local config = io.open("lg_config.txt", "r+")

	if config then
		for line in config:lines() do
			-- ignore empty lines and comments
			if not line:match("^%s*$") and not line:match("^%s*%*") then
				-- capture the value of extension in quotes
				local extension = line:match('extension%s*=%s*"(.-)"')

				for _, v in pairs(valid_extensions) do
					if v == extension then
						valid_extension = true

						break
					end
				end

				if extension then
					if extension == "default" then
						config_values.extension = default_config_values.extension
					else
						config_values.extension = extension
					end
				end

				-- capture the value of style in quotes
				local style = line:match('style%s*=%s*"(.-)"')

				for _, v in pairs(valid_styles) do
					if v == style then
						valid_style = true

						break
					end
				end

				if style then
					if style == "default" then
						config_values.style = default_config_values.style
					else
						config_values.style = style
					end
				end
			end
		end
	end

	if not check_valid_config() or not valid_extension or not valid_style then
		print(colors.red .. "Invalid configuration file!" .. colors.reset)
		print(colors.yellow .. "Generating new configuration file..." .. colors.reset)

		os.execute("rm lg_config.txt")
		M.generate_config()

		os.exit(1)
	end

	if config then
		config:close()
	end

	return config_values
end

M.update_config = function()
	print(colors.yellow .. "THIS IS THE CONFIGURATION SCRIPT" .. colors.reset)
	print("\nPress 'Enter' to continue...")
	_ = io.read()

	-- define valid options
	local valid_extensions_input = { "1", "2", "3", "4" }
	local valid_style_input = { "1", "2" }

	-- clear screen
	os.execute("clear")

	local extension
	repeat
		print("What file extension do you want to use?")
		print(colors.yellow .. "\nOPTIONS (you can enter the corresponding number):" .. colors.reset)
		print("(1) js")
		print("(2) jsx")
		print("(3) ts")
		print("(4) tsx")

		io.write("--> ")
		extension = io.read()

		if not validate_input(extension, valid_extensions_input) then
			os.execute("clear")
			print(colors.red .. "Invalid input. Please try again." .. colors.reset)
		end
	until validate_input(extension, valid_extensions_input)

	os.execute("clear")

	local style
	repeat
		print("What type of style tool do you want to use?")
		print(colors.yellow .. "\nOPTIONS (you can enter the corresponding number):" .. colors.reset)
		print("(1) CSS")
		print("(2) tailwind")

		io.write("--> ")
		style = io.read()

		if not validate_input(style, valid_style_input) then
			os.execute("clear")
			print(colors.red .. "Invalid input. Please try again." .. colors.reset)
		end
	until validate_input(style, valid_style_input)

	local updated_config = io.open("lg_config.txt", "w+")

	if not updated_config then
		print("ERROR: Unable to update config file")
	else
		updated_config:write("*** THIS FILE IS AUTOGENERATED. DO NOT EDIT. ***\n")
    updated_config:write("root = \"" .. lg_root .. "\"\n")

		if extension == "1" then
			updated_config:write('extension = "js"\n')
		elseif extension == "2" then
			updated_config:write('extension = "jsx"\n')
		elseif extension == "3" then
			updated_config:write('extension = "ts"\n')
		elseif extension == "4" then
			updated_config:write('extension = "tsx"\n')
		end

		if style == "1" then
			updated_config:write('style = "CSS"\n')
		elseif style == "2" then
			updated_config:write('style = "tailwind"\n')
		end

		os.execute("clear")
		print(colors.green .. "Configuration updated successfully!" .. colors.reset)

		updated_config:close()
	end
end

return M
