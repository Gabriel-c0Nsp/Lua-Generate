local M = {}

M.component_template = function(component_name)
	local templates = {
		component_js = string.format(
			[[
export default function %s() {
  return (
    <>
    </>
  );
}
  ]],
			component_name
		),

		component_jsx = string.format(
			[[
export default function %s() {
  return (
    <>
    </>
  );
}
  ]],
			component_name
		),

		component_ts = string.format(
			[[
export default function %s() {
  return (
    <>
    </>
  );
}
  ]],
			component_name
		),

		component_tsx = string.format(
			[[
export default function %s() {
  return (
    <>
    </>
  );
}
  ]],
			component_name
		),
	}

	return templates
end

M.svg_template = function(svg_name)
  -- TODO: Implement this function
end

return M
