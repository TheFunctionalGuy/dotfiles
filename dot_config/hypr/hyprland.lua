---@module 'hl'

-- stylua: ignore start
-- Colors
local colors = require("colors")

-- Integrated Display
hl.monitor({ output = "eDP-1",                                      mode = "preferred", position = "0x0",        scale = 1 })
hl.monitor({ output = "desc:Acer Technologies XB253Q TH5EE0058521", mode = "highrr",    position = "-1920x120",  scale = 1 })
hl.monitor({ output = "desc:Dell Inc. DELL S2722QC 5ZMNLD3",        mode = "preferred", position = "auto",       scale = 1.5 })
hl.monitor({ output = "desc:Dell Inc. DELL P3421W F5B8TR3",         mode = "preferred", position = "-3440x-240", scale = 1 })
hl.monitor({ output = "desc:Dell Inc. DELL P3421W 6MB8TR3",         mode = "preferred", position = "-760x-1440", scale = 1 })
hl.monitor({ output = "desc:Dell Inc. DELL U2515H 9X2VY52D0DPL",    mode = "preferred", position = "-2560x-240", scale = 1 })

-- Some default env vars.
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

hl.config({
  general = {
    gaps_in     = 4,
    gaps_out    = 4,
    border_size = 2,
    col = {
      active_border   = {
        colors = {
          colors.blue,
          colors.green,
        },
        angle = 45,
      },
      inactive_border = colors.black,
    },

    layout            = "dwindle",
    no_focus_fallback = true,
  },

  dwindle = {
    preserve_split = true,
    force_split    = 2,
  },

  input = {
    kb_layout    = "de,us",
    kb_variant   = "nodeadkeys,",
    kb_options   = "grp:win_space_toggle",

    -- 2 - Cursor focus will be detached from keyboard focus. Clicking on a window will move keyboard focus to that window
    follow_mouse = 2,

    repeat_rate  = 50,
    repeat_delay = 300,

    touchpad = {
      natural_scroll = true,
    },
  },

  cursor = {
    no_warps          = true,
    hide_on_key_press = true,
  },

  misc = {
    disable_hyprland_logo     = true,
    disable_splash_rendering  = true,
    background_color          = "rgb(1d1f2f)",
    on_focus_under_fullscreen = 2,
  },

  -- Styling
  decoration = {
    rounding = 0,

    shadow = {
      enabled      = true,
      range        = 4,
      render_power = 3,
      color        = "rgba(00000099)",
    },

    blur = {
      enabled           = true,
      size              = 3,
      passes            = 1,
      new_optimizations = true,
    },
  },

  animations = {
    enabled = false,
  },
})

-- Binds
require("binds")

-- Rules
require("rules")

-- Execs
require("execs")
-- stylua: ignore end
