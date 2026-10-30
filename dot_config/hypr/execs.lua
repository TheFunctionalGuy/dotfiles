---@module 'hl'

hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("dunst")
    hl.exec_cmd("nm-applet --indicator")

    -- Getting Started Message
    hl.exec_cmd("hyprland-welcome")

    -- Tray apps need Waybar's tray to be up, so start them once its bar opens
    local waybarOpened
    waybarOpened = hl.on("layer.opened", function(layer)
        if layer.namespace ~= "waybar" then
            return
        end
        waybarOpened:remove()

        hl.exec_cmd("keepassxc")
        hl.exec_cmd("nextcloud --background")
        hl.exec_cmd("ferdium")
    end)

    hl.exec_cmd("waybar --config ~/.config/waybar/config.jsonc")
end)
