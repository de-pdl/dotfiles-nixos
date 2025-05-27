{ config, pkgs, ... }:

{
  home.username = "ayush";
  home.homeDirectory = "/home/ayush";

  home.stateVersion = "24.05";  # Match your current NixOS version

  # Set Hyprland config path environment variable
  home.sessionVariables = {
    HYPRLAND_CONFIG_DIR = ./.config/hypr;
  };

 
  home.services.mako.enable = true; 
  # Optional: common user tools
  programs.zsh.enable = true;
  home.packages = with pkgs; [
    git
    neovim
    kitty
    kdePackages.dolphin
    wofi
    mako
    
  ];
}

