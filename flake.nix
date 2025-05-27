{
  description = "all to water all to dirt, breathe now and forget it all";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    #home manager
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    
    #hardware-config
    inputs.nixos-hardware.url = "github:NixOS/nixos-hardware/master";

  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system: 
    	let
      		pkgs   = import nixpkgs {
			inherit system;
			config.allowUnfree = true;
		};
	in {
		homeConfigurations.ayush = home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			modules  = [ ./home/ayush.nix];
		};
	}) // 

     {
     nixosConfigurations.dev-env-pmx = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
		./machines/dev-env-pmx/configuration.nix
	    	./machines/dev-env-pmx/hardware-configuration.nix
		home-manager.nixosModules.home-manager 
	    {
	    	home-manager.useUserPackages = true;
		home-manager.useGlobalPkgs = true;
		home-manager.users.ayush = import ./home/ayush.nix;
            }
          ];
        };
      nixosConfigurations.surface = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
		./machines/surface/configuration.nix
	    	./machines/surface/hardware-configuration.nix
		nixos-hardware.nixosModules.microsoft-surface-laptop-amd
		home-manager.nixosModules.home-manager 
	    {
	    	home-manager.useUserPackages = true;
		home-manager.useGlobalPkgs = true;
		home-manager.users.ayush = import ./home/ayush.nix;
            }
          ];
      };
	
	};
  	
}
