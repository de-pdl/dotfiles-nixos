{ config, pkgs, lib, ... }:

{
  # hyprland example:
  imports = [ ./hyprland.nix ];

  # any extra config:
  services.xserver.enable = true;
}

