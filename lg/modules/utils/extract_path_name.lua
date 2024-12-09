local extract_path_name = function(function_name, path)
	if function_name == nil then
		return nil
	end

  -- removes last slash of the string if it exists
	if function_name:sub(-1) == "/" then
		function_name = function_name:sub(1, -2)
	end

	if function_name:find("/") and not path then
		-- checks if the first character is not a letter

		-- FIXME: It don't seem to catch when the file starts with only a dot
		if function_name:match("^%W") then
			if function_name:sub(1, 2) ~= "./" then
				return nil
			end
		end

		-- get everything behind the last slash (including the slash)
		path = function_name:match("(.*/)")

		-- get the last directory in the path
		function_name = function_name:match(".+/(.+)")

		return path, function_name
	end

	if not path then
		return "./", function_name
	end

	return nil
end

return extract_path_name
