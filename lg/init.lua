local debug = require("modules.utils.debug")

local config = require("modules.config.config")
local args = require("modules.args.args")
local lg_generate = require("modules.args.options.lg_generate")

-- creates config file
config.generate_config()

args.check_args(arg)

-- debug.display_args(arg)

-- lg_generate.generate_component(arg[1], arg[2])
