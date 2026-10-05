-- ~/.config/hypr/modules/binds.lua

-- Set programs that you use
local terminal = "kitty"
local fileManager = "thunar"
local browser = "firefox"
local uwsm_start = "uwsm app -- "
local ipc = "noctalia msg "

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + A", hl.dsp.window.close())
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit")) -- dwindle only

-- WINDOWS
-- Toggle
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Move focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move Windows
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Map AZERTY to workspace numbers
local ws_keys = {
	{ key = "Ampersand", ws = 1 },
	{ key = "Eacute", ws = 2 },
	{ key = "Quotedbl", ws = 3 },
	{ key = "Apostrophe", ws = 4 },
	{ key = "Parenleft", ws = 5 },
	{ key = "Minus", ws = 6 },
	{ key = "Egrave", ws = 7 },
	{ key = "Underscore", ws = 8 },
	{ key = "ccedilla", ws = 9 },
	{ key = "agrave", ws = 10 },
}

-- Workspace mapping
for _, mapping in ipairs(ws_keys) do
	-- Switch workspaces
	hl.bind(mainMod .. " + " .. mapping.key, hl.dsp.focus({ workspace = mapping.ws }))

	-- Move active window to a workspace
	hl.bind(mainMod .. " + SHIFT + " .. mapping.key, hl.dsp.window.move({ workspace = mapping.ws }))
end

-- Switch focus to next monitor
hl.bind(mainMod .. " + SPACE", hl.dsp.focus({ monitor = "+1" }))
-- Move window to next monitor
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.move({ monitor = "+1" }))
-- Move workspace to next monitor
hl.bind(mainMod .. " + CTRL + SPACE", hl.dsp.workspace.move({ monitor = "+1" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + SHIFT + mouse:272", hl.dsp.window.resize(), { mouse = true })

-- Resize windows with hjkl
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
-- Start a submap called "resize".
hl.define_submap("resize", function()
	-- Set repeating binds for resizing the active window.
	hl.bind("l", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind("h", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
	-- Use `reset` to go back to the global submap
	hl.bind(mainMod .. " + R", hl.dsp.submap("reset"))
	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("return", hl.dsp.submap("reset"))
end)

-- Program launch
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(uwsm_start .. terminal))
hl.bind(mainMod .. " + SHIFT + return", hl.dsp.exec_cmd(uwsm_start .. fileManager))
hl.bind("CTRL + ALT + F", hl.dsp.exec_cmd(uwsm_start .. browser))

-- Noctalia keybindings
-- Core binds
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(ipc .. "settings-toggle"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.workspace.toggle_special("settings"))
hl.workspace_rule({ workspace = "special:settings", on_created_empty = "noctalia msg settings-toggle" })

hl.bind("ALT + Tab", hl.dsp.exec_cmd(ipc .. "window-switcher hold"))

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"))
hl.bind("SHIFT + XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "mic-volume-up"))
hl.bind("SHIFT + XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "mic-volume-down"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(ipc .. "mic-mute"))
hl.bind("SHIFT + XF86AudioMute", hl.dsp.exec_cmd(ipc .. "mic-mute"))

-- Media Player Controls
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(ipc .. "media next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(ipc .. "media previous"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(ipc .. "media toggle"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(ipc .. "media toggle"))

-- Clipboard Keys
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(ipc .. "panel-toggle clipboard"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(ipc .. "clipboard-clear"))

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd(ipc .. "screenshot-fullscreen"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(ipc .. "screenshot-region"))

-- Misc binds
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(ipc .. "caffeine-toggle"))
