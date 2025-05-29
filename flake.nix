{
  # https://github.com/anotherhadi/nixy
  description = ''
    I take thee to be my life, but she requests to be free   -- version 1
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    sops-nix.url = "github:Mic92/sops-nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    search-nixos-api.url = "github:anotherhadi/search-nixos-api";
  };

  outputs = inputs@{ nixpkgs, ... }: {
    nixosConfigurations = {
      surface =
        # CHANGEMET: This should match the 'hostname' in your variables.nix file
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            {
              nixpkgs.overlays = [ inputs.hyprpanel.overlay ];
              _module.args = { inherit inputs; };
            }
            inputs.nixos-hardware.nixosModules.microsoft-surface-laptop-amd # CHANGEMET: check https://github.com/NixOS/nixos-hardware
            inputs.home-manager.nixosModules.home-manager
            ./hosts/surface/configuration.nix # CHANGEMET: change the path to match your host folder
          ];
        };
      # Jack is my server
    };
  };
}
