local M = {}

function M.generate_config()
	local config, err = io.open("config.txt", "a+")

	if not config then
		print("ERROR: " .. err)
		return
	end

	return config
end

function M.close_config(config)
	config:close()
end

function M.get_config_values(config)
	local config_values = {
		style = "default",
		extension = "default",
	}

	-- returns the file pointer to the beginning
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

	return config_values
end

return M
