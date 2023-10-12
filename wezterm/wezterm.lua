local wezterm = require 'wezterm';
return {
    font = wezterm.font("JetBrains Mono"),

    -- for MacOS yabai
    -- window_decorations = "RESIZE",

    -- currently broken on Windows, see https://github.com/nushell/nushell/issues/5585
    -- fixed by disabling "shell_integration" in nushell config
    -- default_prog = {"/opt/homebrew/bin/fish"},
    
    -- color_scheme = "Catppuccin Latte",

    native_macos_fullscreen_mode = true,

    line_height = 1.,
    window_background_opacity = 0.9,
    hide_tab_bar_if_only_one_tab = true,

    window_close_confirmation = "NeverPrompt",

    enable_scroll_bar = true,

    use_ime = false,

    -- I'm too lazy to add everything by hand
    -- e.g. copy pasting and stuff
    -- disable_default_key_bindings = true,
    keys = {
        {key="t", mods="CTRL|SHIFT", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        {key="w", mods="CTRL|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=false}}},

        -- these two are default key bindings, but they seem to not work by default
        {key="Tab", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},
        {key="Tab", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=-1}},
    },

    -- makes working in vim kind of annoying
    -- default_cursor_style = "BlinkingBar",
    default_cursor_style = "BlinkingBlock",

    -- Aura color scheme https://github.com/daltonmenezes/aura-theme/tree/main/packages/color-palettes
    colors = {
        foreground = '#edecee',
        background = '#15141b',

        cursor_bg = '#a277ff',
        cursor_fg = '#15141b',
        cursor_border = '#a277ff',

        selection_fg = '#edecee',
        selection_bg = '#29263c',

        ansi = {
          '#110f18',
          '#ff6767',
          '#61ffca',
          '#ffca85',
          '#a277ff',
          '#a277ff',
          '#61ffca',
          '#edecee',
        },
        brights = {
          '#4d4d4d',
          '#ff6767',
          '#61ffca',
          '#ffca85',
          '#a277ff',
          '#a277ff',
          '#61ffca',
          '#edecee',
        },
    },

    -- -- rename the window to "WezTerm" permanently
    -- wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
    --     return "WezTerm"
    -- end),
}
