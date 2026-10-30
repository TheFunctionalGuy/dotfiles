---@module 'hl'

--==============--
-- Window Rules --
--==============--
-- Float Management
-- Custom Class
hl.window_rule({
    match      = { class = "^(floating_window)$" },

    float      = true,
    size       = { "monitor_w * 0.75", "monitor_h * 0.75" },
    center     = true,
    pin        = true,
    dim_around = true,
})

-- Workspace Assignments
-- Special Workspaces
-- KeePassXC
hl.window_rule({ match = { class = "^(org.keepassxc.KeePassXC)$" }, workspace = "special:keepass silent" })

-- Workspace 5 (Chat Apps)
hl.window_rule({ match = { class = "^(org.telegram.desktop)$" },    workspace = "5 silent" })
hl.window_rule({ match = { class = "^(Slack)$" },                   workspace = "5 silent" })
hl.window_rule({ match = { class = "^(discord)$" },                 workspace = "5 silent" })
hl.window_rule({ match = { class = "^(Ferdium)$" },                 workspace = "5 silent" })

-- Workspace 6 (Mail)
hl.window_rule({ match = { class = "^(thunderbird)$" },             workspace = "6 silent" })

-- Style
-- Only Allow Shadows for Floating Windows
hl.window_rule({ match = { float = false },                         no_shadow = true })

-- Qalculate
hl.window_rule({
    name    = "qalculate-style",
    match   = { class = "^(qalculate-.*)$" },

    float   = true,
    size    = { 720, 530 },
    move    = { "cursor_x - (window_w * 0.5)", "cursor_y - (window_h * 0.5)" },
    opacity = "1.0 0.5",
    pin     = true,
    no_blur = true,
})

-- Polkit
hl.window_rule({
    name       = "polkit-style",
    match      = { class = "^(org.kde.polkit-kde-authentication-agent-1)$" },

    float      = true,
    center     = true,
    pin        = true,
    dim_around = true,
})


-- TODO: Add variables for that so that you can do `chezmoi set 'workspace home'` or something similar
--=================--
-- Workspace Rules --
--=================--
hl.workspace_rule({ workspace = "5",  monitor = "eDP-1" })
hl.workspace_rule({ workspace = "10", monitor = "eDP-1" })

-- Home Office
hl.workspace_rule({ workspace = "1",  monitor = "desc:Dell Inc. DELL P3421W F5B8TR3" })
hl.workspace_rule({ workspace = "2",  monitor = "desc:Dell Inc. DELL P3421W F5B8TR3" })
hl.workspace_rule({ workspace = "3",  monitor = "desc:Dell Inc. DELL P3421W F5B8TR3" })
hl.workspace_rule({ workspace = "4",  monitor = "desc:Dell Inc. DELL P3421W F5B8TR3" })
hl.workspace_rule({ workspace = "6",  monitor = "eDP-1" })
hl.workspace_rule({ workspace = "7",  monitor = "desc:Dell Inc. DELL P3421W F5B8TR3" })
hl.workspace_rule({ workspace = "8",  monitor = "desc:Dell Inc. DELL P3421W F5B8TR3" })
hl.workspace_rule({ workspace = "9",  monitor = "desc:Dell Inc. DELL P3421W F5B8TR3" })
