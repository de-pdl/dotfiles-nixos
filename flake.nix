{
  description = "all to water all to dirt, breathe now and forget it all";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs   = import nixpkgs {
        inherit system;
        overlays = [
          (final: prev: {
            guiApps = import ./pkgs/gui/gui_usr_apps/default.nix { pkgs = prev; };
          })
        ];
      };
    in {
      nixosConfigurations = {
      	dev-env-pmx = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs; };

          modules = [
            ./machines/dev-env-pmx/configuration.nix
            ./pkgs/cli               # <-- cli/default.nix
            ./pkgs/gui/env/hyprland
            ./pkgs/gui/env/gui_environment2
          ];
        };
      };

      # if you also want to expose packages:
      packages.${system}.guiApps = pkgs.guiApps;
    };
}
