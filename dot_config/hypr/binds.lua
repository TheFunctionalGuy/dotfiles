---@module 'hl'

local mainMod = "SUPER"

--============--
-- Main Binds --
--============--
-- stylua: ignore start
-- Terminal
hl.bind(mainMod .. " + N",              hl.dsp.exec_cmd("alacritty"))
hl.bind(mainMod .. " + Return",         hl.dsp.exec_cmd("alacritty"))
-- Close
hl.bind(mainMod .. " + Q",              hl.dsp.window.close())
-- Exit
hl.bind(mainMod .. " + CTRL + ALT + Z", hl.dsp.exit())
-- Lock Screen
hl.bind(mainMod .. " + period",         hl.dsp.exec_cmd("waylock -fork-on-lock -init-color 0x222436 -input-color 0x444a73 -fail-color 0xff757f"))
-- File Manager
hl.bind(mainMod .. " + O",              hl.dsp.exec_cmd("thunar"))
-- Calculator
hl.bind(mainMod .. " + C",              hl.dsp.exec_cmd("pkill qalculate-gtk || qalculate-gtk"))
-- Focus Firefox
hl.bind(mainMod .. " + B",              hl.dsp.focus({ window = "title:^(.*Mozilla Firefox)$" }))
-- Toggle Full Screen
hl.bind(mainMod .. " + F",              hl.dsp.window.fullscreen({ mode = "maximized" }))
-- Toggle Floating
hl.bind(mainMod .. " + V",              hl.dsp.window.float({ action = "toggle" }))
-- Launcher
hl.bind(mainMod .. " + D",              hl.dsp.exec_cmd("fuzzel"))
hl.bind(mainMod .. " + P",              hl.dsp.window.pseudo()) -- dwindle
-- Toggle Layout
hl.bind(mainMod .. " + E",              hl.dsp.layout("togglesplit"))
-- Toggle KeePass
hl.bind(mainMod .. " + minus",          hl.dsp.workspace.toggle_special("keepass"))
-- Toggle Tomatez
hl.bind(mainMod .. " + T",              hl.dsp.exec_cmd([[hyprctl clients | rg '^(\s)*(class: pomatez)$' -q && hyprctl dispatch 'hl.dsp.window.close({ window = "title:^(Pomatez)$" })' || pomatez]]))
-- Scratchpad Control
hl.bind(mainMod .. " + S",              hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + SHIFT + S",      hl.dsp.window.move({ workspace = "special:scratchpad" }))
-- Resize
hl.bind(mainMod .. " + R",              hl.dsp.submap("resize"))
-- Move
hl.bind(mainMod .. " + M",              hl.dsp.submap("move"))
-- Advanced Monitor Navigation
hl.bind(mainMod .. " + U",              hl.dsp.focus({ monitor = "l" }))
hl.bind(mainMod .. " + I",              hl.dsp.focus({ monitor = "r" }))
-- stylua: ignore end


--===============--
-- Resize Submap --
--===============--
-- stylua: ignore start
hl.define_submap("resize", function()
  hl.bind("H",               hl.dsp.window.resize({ x = -10, y = 0,   relative = true }), { repeating = true })
  hl.bind("J",               hl.dsp.window.resize({ x = 0,   y = 10,  relative = true }), { repeating = true })
  hl.bind("K",               hl.dsp.window.resize({ x = 0,   y = -10, relative = true }), { repeating = true })
  hl.bind("L",               hl.dsp.window.resize({ x = 10,  y = 0,   relative = true }), { repeating = true })

  -- Reset to Global Submap
  hl.bind("CTRL + C",        hl.dsp.submap("reset"))
  hl.bind("escape",          hl.dsp.submap("reset"))
  hl.bind(mainMod .. " + R", hl.dsp.submap("reset"))
end)
-- stylua: ignore end

--=============--
-- Move Submap --
--=============--
-- stylua: ignore start
hl.define_submap("move", function()
  hl.bind("H",               hl.dsp.window.move({ x = -20, y = 0,   relative = true }), { repeating = true })
  hl.bind("J",               hl.dsp.window.move({ x = 0,   y = 20,  relative = true }), { repeating = true })
  hl.bind("K",               hl.dsp.window.move({ x = 0,   y = -20, relative = true }), { repeating = true })
  hl.bind("L",               hl.dsp.window.move({ x = 20,  y = 0,   relative = true }), { repeating = true })

  -- Reset to Global Submap
  hl.bind("CTRL + C",        hl.dsp.submap("reset"))
  hl.bind("escape",          hl.dsp.submap("reset"))
  hl.bind(mainMod .. " + M", hl.dsp.submap("reset"))
end)
-- stylua: ignore end

--====================--
-- Passthrough Submap --
--====================--
-- stylua: ignore start
hl.bind(mainMod .. " + ALT + P",  hl.dsp.submap("passthrough"))
hl.define_submap("passthrough", function()
  -- Exit passthrough mode
  hl.bind(mainMod .. " + ESCAPE", hl.dsp.submap("reset"))
end)
-- stylua: ignore end

--========================--
-- Window/Workspace Binds --
--========================--
-- stylua: ignore start
-- Move Focus With mainMod + Vim Keys
hl.bind(mainMod .. " + H",         hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J",         hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K",         hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L",         hl.dsp.focus({ direction = "right" }))

-- Move Windows With mainMod + Vim Keys
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- Switch Workspaces With mainMod + [0-9]
-- Move Active Window to a Workspace With mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Scroll Through Existing Workspaces With mainMod + Scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/Resize Windows With mainMod + LMB/RMB and Dragging
hl.bind(mainMod .. " + mouse:272",  hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",  hl.dsp.window.resize(), { mouse = true })
-- stylua: ignore end


--===============--
-- Control Binds --
--===============--
-- stylua: ignore start
-- Audio Control
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"),   { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"),   { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"),   { locked = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { locked = true })
-- Player Control
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd('playerctl -p "firefox" previous'),   { locked = true })
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd('playerctl -p "firefox" play-pause'), { locked = true })
hl.bind("XF86AudioStop",         hl.dsp.exec_cmd('playerctl -p "firefox" stop'),       { locked = true })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd('playerctl -p "firefox" next'),       { locked = true })
hl.bind(mainMod .. " + Home",    hl.dsp.exec_cmd('playerctl -p "firefox" previous'),   { locked = true })
hl.bind(mainMod .. " + End",     hl.dsp.exec_cmd('playerctl -p "firefox" play-pause'), { locked = true })
hl.bind(mainMod .. " + Insert",  hl.dsp.exec_cmd('playerctl -p "firefox" next'),       { locked = true })
-- Brightness Control
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -c backlight set +5%"),    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -c backlight -n set 5%-"), { locked = true, repeating = true })
-- stylua: ignore end

--==============--
-- Polkit Binds --
--==============--
-- Clear the password field with CTRL + U (hyprpolkitagent only knows CTRL + SHIFT + BackSpace)
-- Only enabled while the polkit dialog is focused, so CTRL + U keeps working everywhere else
local polkitClear = hl.bind(
  "CTRL + U",
  hl.dsp.send_shortcut({ mods = "CTRL + SHIFT", key = "BackSpace", window = "class:^(hyprpolkitagent)$" })
)
polkitClear:set_enabled(false)

hl.on("window.active", function(window)
  polkitClear:set_enabled(window ~= nil and window.class == "hyprpolkitagent")
end)
