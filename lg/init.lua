local config = require("modules.config")
local debug = require("modules.utils.debug")

-- creates config file
local config_file = config.generate_config()

local config_values = config.get_config_values(config_file)

debug.show_config_values(config_values)

-- config.update_config(config_file)

-- closes config file 
config.close_config(config_file)
