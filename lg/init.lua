local config = require("modules.config")

-- creates config file
local config_file = config.generate_config()

local config_values = config.get_config_values(config_file)

-- debug porpuses
-- print("Config values:")
--
-- for key, value in pairs(config_values) do
--     print(key, value)
-- end

-- closes config file 
config.close_config(config_file)
