-- ~/.config/hypr/modules/autostart.lua

hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm app -- noctalia")
	hl.exec_cmd("systemctl --user start gcr-ssh-agent.socket")
end)
