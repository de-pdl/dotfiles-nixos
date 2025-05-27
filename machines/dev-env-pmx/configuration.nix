{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Hostname for this machine
  networking.hostName = "test";

  # Bootloader (GRUB on EFI, edit if needed)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Time and locale
  time.timeZone = "Australia/Sydney"; # Change to your time zone
  i18n.defaultLocale = "en_US.UTF-8";

  # Networking
  networking.networkmanager.enable = true;

  # Enable required services
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = false; # Disable if using Hyprland only

  # Enable Wayland support
  environment.variables = {
    NIXOS_OZONE_WL = "1";
  };

  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  # User definition
  users.users.test = {
    isNormalUser = true;
    home = "/home/test";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "video" ];
  };

  # Allow non-free packages (e.g. for drivers or fonts)
  nixpkgs.config.allowUnfree = true;

  # Nix settings (flakes and gc)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";

  # Enable Hyprland system-wide
  programs.hyprland.enable = true;

  # Shell
  programs.zsh.enable = true;

  # Home Manager setup (linked via flake.nix)
  # See flake.nix for `home-manager.users.test = import ./home/test.nix`

  # Default packages for all users
  environment.systemPackages = with pkgs; [
    git
    neovim
    kitty
    wget
    curl
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
