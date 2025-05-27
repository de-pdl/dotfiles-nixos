{ config, pkgs, ... }:

{
  home.username = "ayush";
  home.homeDirectory = "/home/ayush";

  home.stateVersion = "24.05";  # Match your current NixOS version

  #programs.hyprland.enable = true;

  # Symlink Hyprland config from your repo to ~/.config/hypr/hyprland.conf
  xdg.configFile."hypr/hyprland.conf".source = ./ayush/hypr/hyprland.conf;

  # Set Hyprland config path environment variable
  home.sessionVariables = {
    HYPRLAND_CONFIG_DIR = "${config.xdg.configHome}/hypr";
  };

  # Optional: common user tools
  programs.zsh.enable = true;
  home.packages = with pkgs; [
    git
    neovim
    kitty
    kdePackages.dolphin
    wofi
  ];
}

