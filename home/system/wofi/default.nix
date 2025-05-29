# Wofi is a launcher for Wayland, inspired by rofi.
{ config, pkgs, lib, ... }:
{

  programs.wofi = {
    enable = true;

    settings = {
      allow_markup = true;
      width = 650;
      show = "drun";
      prompt = "Apps";
      normal_window = true;
      layer = "top";
      height = "325px";
      orientation = "vertical";
      halign = "fill";
      line_wrap = "off";
      dynamic_lines = false;
      allow_images = true;
      image_size = 24;
      exec_search = false;
      hide_search = false;
      parse_search = false;
      insensitive = true;
      hide_scroll = true;
      no_actions = true;
      sort_order = "default";
      gtk_dark = true;
      filter_rate = 100;
      key_expand = "Tab";
      key_exit = "Escape";
    };
  };

}
