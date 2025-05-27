# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
 
  swapDevices =
    [ { device = "/dev/disk/by-label/swap"; }
    ];
 # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.avahi = {
  enable   = true;
  nssmdns4  = true;       # allows hostname lookups via mDNS
  publish = {
    enable       = true; # advertise this host
    addresses    = true; # advertise its IPs
    workstation  = true;
    userServices = true; # advertise custom services
  };
  };
  networking.hostName = "ayush-nix"; # Define your hostname.
  networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.useDHCP = false;

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ayush = {
    isNormalUser = true;
    description = "Ayush Paudel";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    avahi
    avahi-compat
    wget
    firefox
    remmina
    python3
    steam
    git
    discord
    spotify
    htop
    firefox
    vivaldi
    vlc
    obsidian
    libreoffice
    iverilog
    gtkwave
    kcalc
    uxplay 
    localsend
    #dconf-editor #gnome
    calibre
    foliate
    neovim
    bitwarden-desktop
    nextcloud-client
    python312Packages.zeroconf
    qbittorrent-enhanced
    bambu-studio
    google-chrome
    ocrmypdf
    openvpn
    obs-studio 
    winetricks
    wineWowPackages.waylandFull
    wineWowPackages.stable
    cifs-utils
    pdfrip 
    prismlauncher
];
  
  services.printing.enable = true;
  
  services.tailscale.enable = true;
  services.tailscale.useRoutingFeatures = "client";
  

  services.logind.extraConfig = "HandleLidSwitch=ignore";
  #gnome
  programs.evolution = {
	enable = true;
	plugins = [ pkgs.evolution-ews ];
  };

  services.dbus.packages = [
  	pkgs.dbus.out
  	config.system.path
  ];
  environment.pathsToLink = [ "/etc/dbus-1" "/share/dbus-1" ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  networking.firewall = {
  enable = true;
  # mDNS
  # UxPlay’s default control/data ports
  allowedTCPPorts = [ 7000 7100 ];
  allowedUDPPorts = [ 6000 6001 7011 5353];
  };
  
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  #networking.firewall.allowedUDPPorts = [ 5353 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}


