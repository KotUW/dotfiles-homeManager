local wezterm = require 'wezterm'
-- local mux = wezterm.mux

-- wezterm.on('gui-startup', function(cmd)
--   local tab, pane, window = mux.spawn_window(cmd or {})
--   window:gui_window():maximize()
-- end)

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Font
-- config.font = wezterm.font('Fira Code')
config.font = wezterm.font('LiterationMono Nerd Font')

config.harfbuzz_features = { "zero" , "ss01", "cv05" }
config.font_size = 12

-- Tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom= true
config.window_frame = { font = font }

-- config.color_scheme = 'Alabaster'
config.color_scheme = "Nocturnal Winter"
-- color_scheme = "Dark Pastel"
-- color_scheme = "carbonfox"
-- color_scheme = "DotGov"

-- KeyBindings
config.disable_default_key_bindings = false
config.keys = {
    { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
    { key = 'Enter', mods = 'ALT', action = wezterm.action.DisableDefaultAssignment },
    
    { key = 'r', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'd', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = "t", mods = 'CTRL|SHIFT', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
   
    { key = 'Tab', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateLastTab },
    { key = 'x', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateCopyMode },
    -- { key = ' ', mods = 'CTRL|SHIFT', action = wezterm.action.QuickSelect },
    
    { key = "c", mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo 'Clipboard' },
    { key = "v", mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom'Clipboard' },
    
    { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Right' },
    { key = 'UpArrow', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'DownArrow', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Down' },
    
    { key = 'f', mods = 'CTRL|SHIFT', action = wezterm.action.ToggleFullScreen },
}

-- Starts home-manager managed nix shell.
config.default_prog = {"/home/evil/.nix-profile/bin/fish", "-l"}

-- config.adjust_window_size_when_changing_font_size = false

config.enable_kitty_keyboard = true


return config
