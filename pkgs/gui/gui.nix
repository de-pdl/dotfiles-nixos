{pkgs, ...}: let
 
  flake-compat = builtins.fetchTarball {
	url = "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
  	sha256 = "sha256:09m84vsz1py50giyfpx0fpc7a4i0r1xsb54dh0dpdg308lp4p188";
  };
  
  hyprland = (import flake-compat {
    src = builtins.fetchTarball {
	url =  "https://github.com/hyprwm/Hyprland/archive/main.tar.gz";
	sha256 = "sha256:0wqc7fhxbc8as0zm3qc9cidf5ibh4hkc48zxzwmghfqpmspy30xb";
	};
    }).defaultNix;
in {
  programs.hyprland = {
    enable = true;
    # set the flake package
    package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
}
