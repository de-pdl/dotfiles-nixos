{ config, pkgs, lib, ... }:

{
  	services.xserver.enable = true;

	services.xserver.displayManager.sddm.enable = true;
	services.xserver.desktopManager.plasma6.enable = true;

	services.xrdp.enable = true;
	services.xrdp.defaultWindowManager = "xterm";
	services.xrdp.openFirewall = true;
  # Optional: additional GUI packages
}
