{ config, lib, ... }: {
  imports = [
    # Choose your theme here:
    #../../themes/nixy.nix
  ];

  config.var = {
    hostname = "surface";
    username = "ayush";
    configDirectory = "/home/" + config.var.username
      + "/.config/nixos"; # The path of the nixos configuration directory

    keyboardLayout = "us";

    location = "Sydney";
    timeZone = "Australia/Sydney";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";

    git = {
      username = "de-pdl";
      email = "83343839+de-pdl@users.noreply.github.com";
      };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  # Let this here
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };
}
