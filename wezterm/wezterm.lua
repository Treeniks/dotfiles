local wezterm = require 'wezterm';
return {
    color_scheme = "Aura (Gogh)",
    font = wezterm.font("MesloLGM NF"),
    line_height = 1.,
    window_background_opacity = 0.9,

    window_close_confirmation = "NeverPrompt",

    default_prog = {"nu"},

    enable_scroll_bar=true,
    -- hide_tab_bar_if_only_one_tab = true,

    -- disable_default_key_bindings = true,
    keys = {
        {key="t", mods="CTRL", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        {key="w", mods="CTRL|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=false}}},
        -- these two are default key bindings, but they seem to not work by default
        {key="Tab", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},
        {key="Tab", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=-1}},
    },

    -- * anything else breaks with background opacity
    -- seems to be fixed now
    default_cursor_style= "BlinkingBar",

    -- rename the window to "WezTerm" permanently
    wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
        return "WezTerm"
    end),

    -- * newer wezterm looks nice without all this
    -- colors = {
    --     tab_bar = {
    --         -- color of a non-focused window top bar on windows
    --         background = "#2b2b2b",

    --         active_tab = {
    --             bg_color = "#101010",
    --             fg_color = "#bbbbbb",

    --             -- "Half", "Normal", "Bold"
    --             intensity = "Normal",

    --             -- "None", "Single", "Double"
    --             underline = "None",
    --             italic = false,
    --             strikethrough = false,
    --         },

    --         inactive_tab = {
    --             bg_color = "#2b2b2b",
    --             fg_color = "#bbbbbb",
    --         },

    --         inactive_tab_hover = {
    --             bg_color = "#505050",
    --             fg_color = "#bbbbbb",
    --             -- italic = true,
    --         },

    --         new_tab = {
    --             bg_color = "#2b2b2b",
    --             fg_color = "#bbbbbb",
    --         },

    --         new_tab_hover = {
    --             bg_color = "#505050",
    --             fg_color = "#bbbbbb",
    --             -- italic = true,
    --         }
    --     }
    -- }
}
