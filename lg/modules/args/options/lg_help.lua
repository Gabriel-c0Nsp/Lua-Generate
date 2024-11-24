local colors = require("modules.utils.colors")

local M = {}

M.help_message = function()
	local message = string.format(
		[[
  %sLua Generate%s

  CLI tool for generating boilerplate code for Next.js projects.

  This tool aims to simplify the creation of common files and directories
  in Next.js projects. One of its key advantages is customization, allowing
  users to set the file extension for generated files (e.g., .js, .jsx, .ts, .tsx).

  In case of unexpected behavior, the script provides feedback to the user
  through interactive error messages and alerts (with color highlights),
  enhancing the user experience while leaving error-handling decisions
  up to the user.

  Commands:
    %slg i%s - Initialize Lua Generate in the current directory (root of the project)
      Alternative syntax:
        - lg init

    %slg c%s - Show the current configuration 
      Alternative syntax:
        - lg config

    %slg c u%s - Runs a script to update the configuration
      Alternative syntax:
        - lg config u
        - lg c update
        - lg config update

    %slg g c %s<component_name> [path]%s - Generate a component file with the specified name 
      Alternative syntax:
        - lg generate c <component_name> [path]
        - lg g component <component_name> [path]
        - lg generate component <component_name> [path]

    %slg g p %s<path> [function_name]%s - Generates a directory with a page file inside
      Alternative syntax:
        - lg generate p <path> [function_name]
        - lg g page <path> [function_name]
        - lg generate page <path> [function_name]

    %slg g s %s<svg_name> [target_file_path]%s - Creates a file with an SVG tag
      Alternative syntax:
        - lg generate s <svg_name> [target_file_path]
        - lg g svg <svg_name> [target_file_path]
        - lg generate svg <svg_name> [target_file_path]

    %slg h%s - Show this help message
      Alternative syntax:
        - lg help
        - lg --help

  Note: 
    - [] denotes optional arguments
    - <> denotes required arguments

  Options:
    <component_name>    - The name of the component to generate
    <svg_name>          - The name of the SVG file to generate
    <path>              - The path where the file or directory should be created
    [function_name]     - The name of the function to generate
    [target_file_path]  - Optional. The path of the file to copy the SVG content from
    [path]              - Optional. The path where the file or directory should be created ]],
		colors.bold,
		colors.reset,
    colors.green,
    colors.reset,
		colors.green,
		colors.reset,
		colors.green,
		colors.reset,
		colors.green,
		colors.yellow,
		colors.reset,
		colors.green,
		colors.yellow,
		colors.reset,
		colors.green,
		colors.yellow,
		colors.reset,
		colors.green,
		colors.reset
	)

	print(message)
end

return M
