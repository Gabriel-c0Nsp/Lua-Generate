local config = require("modules.config")
local debug = require("modules.utils.debug")
local lg_config = require("modules.args.lg_config")
local lg_generate = require("modules.args.lg_generate")
local lg_help = require("modules.args.lg_help")

-- creates config file
local config_file = config.generate_config()
-- config.update_config()

local config_values = config.get_config_values(config_file)
-- debug.show_config_values(config_values)

-- testing purposes
-- lg_generate.generate_component(arg[1], arg[2])
-- lg_generate.generate_page(arg[1])
-- lg_generate.generate_svg(arg[1], arg[2])
-- lg_help.help_message()

-- lg_config.show_config()

-- closes config file
config.close_config(config_file)
