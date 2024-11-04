local config = require("modules.config")
local debug = require("modules.utils.debug")
local lg_config = require("modules.args.lg_config")

-- creates config file
local config_file = config.generate_config()
-- config.update_config(config_file)

local config_values = config.get_config_values(config_file)
-- debug.show_config_values(config_values)

if arg[1] == "c" then
  lg_config()
end


-- closes config file 
config.close_config(config_file)
