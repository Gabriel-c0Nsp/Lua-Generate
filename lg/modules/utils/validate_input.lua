local function validate_input(input, valid_options)
	for _, option in ipairs(valid_options) do
		if input == option then
			return true
		end
	end
	return false
end

return validate_input
