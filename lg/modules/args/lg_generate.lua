local config = require("modules.config")
local file_exist = require("modules.utils.check_file_exist")

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

	-- Checks if `path` ends with a slash and, if not, adds one
	if path:sub(-1) ~= "/" then
		path = path .. "/"
	end

	-- Cria o diretório, se necessário
	os.execute("mkdir -p " .. path)

	local component = [[
    qualquer coisa para testar
    e ver o que acontece
      algo aqui
      isso foi com tab, eu acho
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
    -- TODO: better way to handle this
		print("The file already exists")
	end
end
return M
