local config = require("modules.config")
local debug = require("modules.utils.debug")
local lg_config = require("modules.args.lg_config")
local lg_generate = require("modules.args.lg_generate")

-- creates config file
local config_file = config.generate_config()
-- config.update_config(config_file)

local config_values = config.get_config_values(config_file)
-- debug.show_config_values(config_values)

-- testing purposes
-- lg_generate.generate_component(arg[1], arg[2])
-- lg_generate.generate_page(arg[1])

-- lg_config.show_config()

-- closes config file
config.close_config(config_file)
