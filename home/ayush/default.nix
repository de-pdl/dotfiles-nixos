{ config, pkgs, ... }:

{
  home.username = "ayush";
  home.homeDirectory = "/home/ayush";

  home.stateVersion = "24.05";  # Match your current NixOS version

  services.mako.enable = true; 
  programs.waybar.enable = true;  
 

  home.packages = with pkgs; [
    
    #life-essentials 
    git
    neovim

    #wayland pkg

    #terminal
    kitty 

    #file manager
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    gvfs
    xfce.tumbler

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
}

