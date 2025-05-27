{ config, pkgs, lib, ... }:

{
  programs.hyprland.enable = true;
  # read your hyprland.conf verbatim

  environment.systemPackages = with pkgs; [
    foot
    waybar
    kitty
    wofi
    kdePackages.dolphin
  ];
}
