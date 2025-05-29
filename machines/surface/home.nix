{ config, pkgs, ... }:

{

  imports = [
  
  ./variables.nix #user 

  #../../home/programs/nvim #text editor


  ];

  home = {

	inherit (config.var) username;
	homeDirectory = "/home/" + config.var.username; 
 
	packages = with pkgs; [
    
    	#life-essentials 
    	git

    	#wayland pkg

    	#terminal
    	kitty 

    	#file manager - in machine configuration
    	xfce.thunar
    	#screenshot tool
	grimblast
 
   	wofi
    	mako
    	waybar
    	hyprpaper
    	networkmanagerapplet

    	nerd-fonts.fira-code
  

    	##network
    	#avahi
    	#avahi-compat
    	wget 

    	##remote
    	remmina
    	localsend
    	openvpn

    	##browser
    	firefox
    	google-chrome

    	##managers
    	bitwarden-desktop

    	##language
    	python3

    	##personal
    	discord
    	spotify
    	prismlauncher

    	##eng-suite
    	gtkwave
    	iverilog

    	##office-suite
    	libreoffice  
    	obsidian         
    	calibre
   
    	##resource-trackers
    	htop

    	##media
    	vlc #need to conf 
    	obs-studio


   	##vms/wines
   	#winetricks
   	#wineWowPackages.stable
   	#wineWowPackages.waylandFull
  ];

  stateVersion = "25.05";
  };
  
  programs.home-manager.enable = true;
}

