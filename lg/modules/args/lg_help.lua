local M = {}

M.help_message = function()
	local message = [[
   Lua Generate.

  CLI tool for generating boilerplate code for Next.js projects.

  This tool aims to simplify the creation of common files and directories
  in Next.js projects. One of its key advantages is customization, allowing
  users to set the file extension for generated files (e.g., .js, .jsx, .ts, .tsx).

  In case of unexpected behavior, the script provides feedback to the user
  through interactive error messages and alerts (with color highlights),
  enhancing the user experience while leaving error-handling decisions
  up to the user.

  Commands
    lg c - Show the current configuration 
      Alternative syntax:
        - lg config

    lg c u - Runs a script to update the configuration
      Alternative syntax:
        - lg config u
        - lg c update
        - lg config update

    lg g c <component_name> [path]  - Generate a component file with the specified name 
      Alternative syntax:
        - lg generate c <component_name> [path]
        - lg g component <component_name> [path]
        - lg generate component <component_name> [path]

    lg g p <directory_name> [path]  - Generates a directory with the specified name and page file inside
      Alternative syntax:
        - lg generate p <directory_name> [path]
        - lg g page <directory_name> [path]
        - lg generate page <directory_name> [path]

    lg g s <svg_name> [target_file_path]  - Creates a file with an SVG tag
      Alternative syntax:
        - lg generate s <svg_name> [target_file_path]
        - lg g svg <svg_name> [target_file_path]
        - lg generate svg <svg_name> [target_file_path]

    lg h - Show this help message
      Alternative syntax:
        - lg help
        - lg --help

  Note: 
    - [] denotes optional arguments
    - <> denotes required arguments

  Options:
    <component_name>    - The name of the component to generate
    <directory_name>    - The name of the directory to generate
    <svg_name>          - The name of the SVG file to generate
    [target_file_path]  - Optional. The path of the file to copy the SVG content from
    [path]              - Optional. The path where the file or directory should be created ]]

	print(message)
end

return M
