---@module 'hl'

local WAYBAR_LOG = "/tmp/waybar.log"

hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("dunst")
    hl.exec_cmd("nm-applet --indicator")

    -- Getting Started Message
    hl.exec_cmd("hyprland-welcome")

    -- Special Waybar Solution
    hl.exec_cmd("~/.config/hypr/launch.sh " .. WAYBAR_LOG)
    hl.exec_cmd("waybar --config ~/.config/waybar/config.jsonc > " .. WAYBAR_LOG)
end)
