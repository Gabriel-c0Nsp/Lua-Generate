local debug = require("modules.utils.debug")

local config = require("modules.config")
local args = require("modules.args.args")
local lg_generate = require("modules.args.options.lg_generate")

-- creates config file
local config_file = config.generate_config()

args.check_args(arg)

-- debug.display_args(arg)

-- lg_generate.generate_component(arg[1], arg[2])
-- closes config file
config.close_config(config_file)
