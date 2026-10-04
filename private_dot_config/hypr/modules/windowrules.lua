-- ~/.config/hypr/modules/windowrules.lua

-- Defining workspaces
local workspaces = {
	{ id = "1", icon = "", monitor = "DP-1", persistent = true },
	{ id = "2", icon = "󰈹", monitor = "DP-2" },
	{ id = "3", icon = "󰇰", monitor = "DP-2" },
	{ id = "4", icon = "󱓟", monitor = "DP-1" },
	{ id = "5", icon = "󰧮", monitor = "" },
	{ id = "6", icon = "󰯜", monitor = "DP-1" },
	{ id = "7", icon = "󰇄", monitor = "DP-2" },
	{ id = "8", icon = "󰺷", monitor = "DP-1" },
	{ id = "9", icon = "󱋊", monitor = "DP-2" },
	{ id = "10", icon = "󰉖", monitor = "DP-2" },
}

for _, workspace in ipairs(workspaces) do
	hl.workspace_rule({
		workspace = workspace.id,
		default_name = workspace.icon,
		persistent = workspace.persistent,
		monitor = workspace.monitor,
	})
end

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

-- Noctalia Settings Window Rule
hl.window_rule({
	match = { class = "dev.noctalia.Noctalia" },
	float = true,
	size = { "(monitor_w*0.9)", "(monitor_h*0.9)" },
	-- size = { 1080, 920 },
})
