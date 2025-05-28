{
  description = "all to water all to dirt, breathe now and forget it all";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    #hardware-config
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    #system pkgs

    #desktop environment
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";	# main window manager
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel"; 				# bar {all the lil gadgets ig on the top}
    nixvim.url = "github:nix-community/nixvim";					# neovim for nix through flake


    hyprspace = {								# workspace manager
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };

    # essentials
    sops-nix.url = "github:Mic92/sops-nix"; 					# secrets
    search-nixos-api.url = "github:anotherhadi/search-nixos-api";		# nix api
    
    home-manager = {                               				#home-manager {usr pkg}
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   
    # person style
    stylix.url = "github:danth/stylix"; 					# themeing framework
    #apple-fonts.url = "github:Lyndeno/apple-fonts.nix"; 			# fonts

    # server items
    #nixarr.url = "github:rasmus-kirk/nixarr"; 					# media-server
    #anyrun.url = "github:fufexan/anyrun/launch-prefix"; 			# malware-sandbox

    # app-specific
    nixcord.url = "github:kaylorben/nixcord"; 					# discord cli
    zen-browser.url = "github:0xc000022070/zen-browser-flake"; 			# brower
    spicetify-nix = {								# spotify cli
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
        


  };

  outputs = inputs @ { nixpkgs, ... }:
  {
     nixosConfigurations = {

     dev-env-pmx = 
     nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
		./machines/dev-env-pmx/configuration.nix
	    	./machines/dev-env-pmx/hardware-configuration.nix
		inputs.home-manager.nixosModules.home-manager 
          ];
      };
      
      surface = 
      nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
	  	{
			nixpkgs.overlays = [ inputs.hyprpanel.overlay ];
			_module.args = { inherit inputs; };
		}
		./machines/surface/configuration.nix
		inputs.nixos-hardware.nixosModules.microsoft-surface-laptop-amd
		inputs.home-manager.nixosModules.home-manager
		inputs.stylix.nixosModules.stylix
          ];
      };
	
      };
  	
   };

}
