local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "rose-pine-moon"
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 15.0
config.window_background_opacity = 0.8
config.macos_window_background_blur = 60
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

local battery = wezterm.plugin.require("https://github.com/rootiest/battery.wez")

battery.apply_to_config(config)

local quota = wezterm.plugin.require("https://github.com/EdenGibson/wezterm-quota-limit")
quota.apply_to_config(config, {
  poll_interval_secs = 120,
  position = "left",
  colors = "auto",
  icons = {
    week = "▪",
  },
})

return config

