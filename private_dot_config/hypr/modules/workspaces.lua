-- ~/.config/hypr/modules/workspaces.lua

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

-- "Smart gaps" / "No gaps when only"
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 5, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 5, gaps_in = 0 })
