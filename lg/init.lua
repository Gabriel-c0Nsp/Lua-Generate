local config = require("modules.config.config")
local args = require("modules.args.args")
local templates = require("modules.templates.templates")

-- creates config file
config.generate_config()

-- check if user passed valid arguments
args.check_args(arg)
