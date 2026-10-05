-- ~/.config/hypr/modules/windowrules.lua

-- App binding to workspace
local apps_bindings = {
	{ class = "firefox", ws = "2" },
	{ class = "thunar", ws = "10" },
}

for _, app in ipairs(apps_bindings) do
	hl.window_rule({
		match = { class = app.class },
		workspace = app.ws,
	})
end

-- Misc window rules
-- idle inhibit fullscreen
hl.window_rule({
	name = "fullscreen-idle-inhibit",
	match = { fullscreen = true, fullscreen_state_client = 2 },
	idle_inhibit = "always",
})

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.layer_rule({
	name = "no-anim-overlay",
	match = { namespace = "^my-overlay$" },
	no_anim = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})

-- "Smart gaps" / "No gaps when only"
hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 1,
	rounding = 14,
	rounding_power = 2,
})
hl.window_rule({
	name = "no-gaps-f1",
	match = { float = false, workspace = "f[1]" },
	border_size = 1,
	rounding = 14,
	rounding_power = 2,
})
