local colors = require("modules.utils.colors")
local validate_input = require("modules.utils.validate_input")

local function get_user_choice(error_message, warning_to_repeat, default_value)
  local choice
  print(colors.yellow .. error_message .. colors.reset)
  local valid_options = { "y", "n" }

  repeat
    print(warning_to_repeat)
    io.write("--> ")
    choice = io.read()
    choice = choice:lower()

    if choice == "" then
      choice = default_value
    end

    if not validate_input(choice, valid_options) then
      print(colors.red .. "Invalid input. Please try again." .. colors.reset)
    end
  until validate_input(choice, valid_options)
  return choice
end

return get_user_choice
