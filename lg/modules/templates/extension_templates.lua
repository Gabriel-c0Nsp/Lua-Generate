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

M.svg_template = function(svg_name, svg_content)
	svg_content = svg_content or ""

	local templates = {
		svg_js = string.format(
			[[
export default function %s() {
  return (
    <>
      <svg>
        %s
      </svg>
    </>
  );
}
  ]],
			svg_name,
			svg_content
		),

		svg_jsx = string.format(
			[[
export default function %s() {
  return (
    <>
      <svg>
        %s
      </svg>
    </>
  );
}
  ]],
			svg_name,
			svg_content
		),

		svg_ts = string.format(
			[[
export default function %s() {
  return (
    <>
      <svg>
        %s
      </svg>
    </>
  );
}
  ]],
			svg_name,
			svg_content
		),

		svg_tsx = string.format(
			[[
export default function %s() {
  return (
    <>
      <svg>
        %s
      </svg>
    </>
  );
}
  ]],
			svg_name,
			svg_content
		),
	}

	return templates
end

return M
