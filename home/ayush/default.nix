{ config, pkgs, ... }:

{
  home.username = "ayush";
  home.homeDirectory = "/home/ayush";

  home.stateVersion = "24.05";  # Match your current NixOS version

  # Set Hyprland config path environment variable
  home.sessionVariables = {
    HYPRLAND_CONFIG_DIR = ./.config/hypr;
  };

  home.file.".config/waybar/config".source = ./.config/waybar/config;
  home.file.".config/waybar/style.css".source = ./.config/waybar/style.css;
 
  services.mako.enable = true; 
  programs.waybar.enable = true;  


  
  
  programs.zsh.enable = true;
  home.packages = with pkgs; [
    git
    neovim
    kitty
    kdePackages.dolphin
    wofi
    mako
    
    waybar
    hyprpaper
    networkmanagerapplet
    firefox

    (nerdfonts.override { fonts = [ "FiraCode" ]; })
   
  ];
}

