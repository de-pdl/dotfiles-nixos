{ config, pkgs, lib, ... }:

{
  programs.hyprland.enable = true;

  # read your hyprland.conf verbatim
  programs.hyprland.extraConfig = builtins.readFile ./hyprland.conf;

  environment.systemPackages = with pkgs; [
    foot
    waybar
    wofi
  ];
}
