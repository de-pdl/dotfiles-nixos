{ config, pkgs, ... }:

{
  home.username = "ayush";
  home.homeDirectory = "/home/ayush";

  home.stateVersion = "24.05";  # Match your current NixOS version

  # Set Hyprland config path environment variable
  home.sessionVariables = {
    HYPRLAND_CONFIG_DIR = "${config.xdg.configHome}/hypr";
  };

  NIXOS_OZONE_WL = 1;

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

