local colors = require("modules.utils.colors")
local validate_input = require("modules.utils.validate_input")

local M = {}

M.generate_config = function()
	local config = io.open("config.txt", "r")

	if not config then
		config = io.open("config.txt", "w")

		if not config then
			print("ERROR: Unable to create config file")
			return nil
		end

		config:write("*** THIS FILE IS AUTOGENERATED. DO NOT EDIT. ***\n")
		config:write('extension = "default"\n')
		config:write('style = "default"\n')
		config:close()

		config = io.open("config.txt", "r")
	end

	return config
end

M.open_config = function()
	if not io.open("config.txt", "r") then
		return nil
	else
		return io.open("config.txt", "r+")
	end
end

M.close_config = function(config)
	if config then
		config:close()
	end
end

M.get_config_values = function(config)
	local config_values = {
		style = "",
		extension = "",
	}

	-- returns the file pointer to the beginning
	if config then
		config:seek("set")

		for line in config:lines() do
			-- ignore empty lines and comments
			if not line:match("^%s*$") and not line:match("^%s*%*") then
				-- capture the value of style in quotes
				local style = line:match('style%s*=%s*"(.-)"')
				if style then
					config_values.style = style
				end

				-- capture the value of extension in quotes
				local extension = line:match('extension%s*=%s*"(.-)"')
				if extension then
					config_values.extension = extension
				end
			end
		end
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
		print("(2) Tailwind")

		io.write("--> ")
		style = io.read()

		if not validate_input(style, valid_style_input) then
			os.execute("clear")
			print(colors.red .. "Invalid input. Please try again." .. colors.reset)
		end
	until validate_input(style, valid_style_input)

	local updated_config = M.open_config()

	if not updated_config then
		print("ERROR: Unable to update config file")
	else
		updated_config:write("*** THIS FILE IS AUTOGENERATED. DO NOT EDIT. ***\n")

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
			updated_config:write('style = "Tailwind\n"')
		end

		os.execute("clear")
		print(colors.green .. "Configuration updated successfully!" .. colors.reset)
	end

	M.close_config(updated_config)
end

return M
