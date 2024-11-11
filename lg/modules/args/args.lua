local colors = require("modules.utils.colors")

local lg_help = require("modules.args.options.lg_help")
local lg_config = require("modules.args.options.lg_config")
local lg_generate = require("modules.args.options.lg_generate")

local M = {}

local function invalid_arguments()
	print(colors.red .. "Invalid arguments!" .. colors.reset)
	print("You can try: lg --help for more information")
	os.exit(1)
end

local function too_many_args()
	print(colors.red .. "Too many arguments!" .. colors.reset)
	print("You can try: lg --help for more information")
	os.exit(1)
end

local function check_any_args(args)
	if #args == 0 then
		print(colors.yellow .. "You need to provide at least one argument!" .. colors.reset)
		print("You can try: lg --help for more information")
		os.exit(1)
	end
end

local function in_case_generate(args)
	if #args == 1 then
		print(colors.yellow .. "You need to specify what you want to generate!" .. colors.reset)
		print("You can try: lg --help for more information")
		os.exit(1)
	else
		if args[2] == "c" or args[2] == "component" then
			if #args > 4 then
				too_many_args()
			elseif #args == 2 then
				print(colors.yellow .. "You need to provide a name for the component!" .. colors.reset)
				print("You can try: lg --help for more information")
				os.exit(1)
			else
				local component_name = args[3]
				local compoment_path = args[4]

				lg_generate.generate_component(component_name, compoment_path)
			end
		elseif args[2] == "p" or args[2] == "page" then
			if #args == 2 then
				print(colors.yellow .. "You need to provide a path for the page!" .. colors.reset)
				print("You can try: lg --help for more information")
				os.exit(1)
			elseif #args > 3 then
				too_many_args()
			else
				local page_path = args[3]

				lg_generate.generate_page(page_path)
			end
    else
      invalid_arguments()
		end
	end
end

local function in_case_config(args)
	if #args == 1 then
		lg_config.show_config()
	elseif #args > 1 and #args < 3 then
		if args[2] == "u" or args[2] == "update" then
			lg_config.update_config()
		else
			invalid_arguments()
		end
	else
		too_many_args()
	end
end

local function in_case_help(args)
	if #args > 1 then
		too_many_args()
	else
		lg_help.help_message()
	end
end

-- TODO: Finish implementation
-- NOTE: lg g <whatever> still passing
M.check_args = function(args)
	check_any_args(args)
	if args[1] == "c" or args[1] == "config" then
		in_case_config(args)
	elseif args[1] == "g" or args[1] == "generate" then
		in_case_generate(args)
	elseif args[1] == "h" or args[1] == "help" or args[1] == "--help" then
		in_case_help(args)
	else
		invalid_arguments()
	end
end

return M
