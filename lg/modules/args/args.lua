local colors = require("modules.utils.colors")
local error_messages = require("modules.utils.output_logs")

local config = require("modules.config.config")
local lg_help = require("modules.args.options.lg_help")
local lg_config = require("modules.args.options.lg_config")
local lg_generate = require("modules.args.options.lg_generate")

local M = {}

local function check_any_args(args)
	if #args == 0 then
		print(colors.yellow .. "You need to provide at least one argument!" .. colors.reset)
		print("You can try: lg --help for more information")
		os.exit(1)
	end
end

local function git_repo(current_dir)
	current_dir = current_dir or os.getenv("PWD")

	local git_path = current_dir .. "/.git"
	if os.execute("[ -d " .. git_path .. " ]") then
		return current_dir
	end

	local parent_dir = current_dir:match("^(.*)/[^/]+$")
	if not parent_dir or parent_dir == current_dir then
		print(colors.red .. "ERROR: This is not a git repository!" .. colors.reset)
		print("You can try: lg --help for more information")
		os.exit(1)
	end

	return git_repo(parent_dir)
end

local function sub_path(greater_path, smaller_path)
	if greater_path:find(smaller_path, 1, true) == 1 then
		return greater_path:sub(smaller_path:len() + 2)
	end
	return greater_path
end

local function in_case_init(args)
	if #args > 2 then
		error_messages.critical_errors()["too_many_args"]()
	end

	if #args == 2 then
		if args[2] == "-s" or args[2] == "-silent" then
			local lg_config_path = os.getenv("PWD")

			local git_path = git_repo()
			local gitignore_file = io.open(git_path .. "/.gitignore", "a+")

			lg_config_path = sub_path(lg_config_path, git_path)

			if gitignore_file then
				gitignore_file:write("\n# configuration file for Lua Generate\n")
				gitignore_file:write(lg_config_path .. "/lg_config.txt")
				gitignore_file:close()
			else
				error_messages.errors()["unable_to_create"](".gitignore")
			end
		else
			error_messages.critical_errors()["invalid_arguments"]()
		end
	end

	config.init()
end

local function in_case_generate(args)
	if #args == 1 then
		print(colors.yellow .. "You need to specify what you want to generate!" .. colors.reset)
		print("You can try: lg --help for more information")
		os.exit(1)
	else
		if args[2] == "c" or args[2] == "component" then
			if #args > 4 then
				error_messages.critical_errors()["too_many_args"]()
			elseif #args == 2 then
				print(colors.yellow .. "You need to provide a name for the component!" .. colors.reset)
				print("You can try: lg --help for more information")
				os.exit(1)
			else
				local component_name = args[3]
				local compoment_path = args[4]

				if args[4] ~= nil then
					compoment_path = args[4]
				end

				lg_generate.generate_component(component_name, compoment_path)
			end
		elseif args[2] == "p" or args[2] == "page" then
			if #args < 3 then
				print(
					colors.yellow .. "You need to provide the path where the page should be generated!" .. colors.reset
				)
				print("You can try: lg --help for more information")
				os.exit(1)
			elseif #args > 4 then
				error_messages.critical_errors()["too_many_args"]()
			else
				if #args == 3 and args[3] == "./" or #args == 3 and args[3] == "." then
					print(colors.yellow .. "You need to provide a function name for the page!" .. colors.reset)
					print("You can try: lg --help for more information")
					os.exit(1)
				else
					local page_path = args[3]
					local function_name = args[4]

					lg_generate.generate_page(page_path, function_name)
				end
			end
		elseif args[2] == "s" or args[2] == "svg" then
			if #args == 2 then
				print(
					colors.yellow
						.. "You need to provide a name for the compoment that will containg the SVG tag!"
						.. colors.reset
				)
				print("You can try: lg --help for more information")
				os.exit(1)
			elseif #args > 4 then
				error_messages.critical_errors()["too_many_args"]()
			else
				local svg_component_name = args[3]
				local svg_file_path = args[4]

				lg_generate.generate_svg(svg_component_name, svg_file_path)
			end
		else
			error_messages.critical_errors()["invalid_arguments"]()
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
			error_messages.critical_errors()["invalid_arguments"]()
		end
	else
		error_messages.critical_errors()["too_many_args"]()
	end
end

local function in_case_help(args)
	if #args > 1 then
		error_messages.critical_errors()["too_many_args"]()
	else
		lg_help.help_message()
	end
end

M.check_args = function(args)
	check_any_args(args)
	if args[1] == "i" or args[1] == "init" then
		in_case_init(args)
	elseif args[1] == "c" or args[1] == "config" then
		in_case_config(args)
	elseif args[1] == "g" or args[1] == "generate" then
		in_case_generate(args)
	elseif args[1] == "h" or args[1] == "help" or args[1] == "--help" then
		in_case_help(args)
	else
		error_messages.critical_errors()["invalid_arguments"]()
	end
end

return M
