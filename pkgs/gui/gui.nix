{ config, pkgs, lib, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Optional: additional GUI packages
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    firefox
  ];
}
